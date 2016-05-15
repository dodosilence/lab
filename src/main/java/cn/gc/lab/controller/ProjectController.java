package cn.gc.lab.controller;

import antlr.debug.MessageAdapter;
import cn.gc.lab.controller.messagge.Message;
import cn.gc.lab.entity.*;
import cn.gc.lab.repository.*;
import org.apache.commons.io.FileUtils;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.objenesis.instantiator.basic.ObjectStreamClassInstantiator;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * Created by tristan on 16/4/27.
 */
@Controller
@RequestMapping("mgr/project")
public class ProjectController {
    @Autowired
    ProjectRepository projectRepository;

    @Autowired
    CourseRepository courseRepository;

    @Autowired
    ProjectEqpMapRepository projectEqpMapRepository;

    @Autowired
    EquipmentRepository equipmentRepository;


    @RequestMapping("list/all")
    public String list(Model model) {
        List<Project> projects = projectRepository.findAll();
        model.addAttribute("projects", projects);
        List<Course> courses = courseRepository.findAll();
        model.addAttribute("courses", courses);
        return "manager/project/project";

    }


    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public Object create(String projectName, String course, @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") Date endDateTime,
                         @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") Date startDateTime) {
        Project project = new Project();

        project.setProjectName(projectName);
        Course one = courseRepository.findOne(course);
        project.setCourse(one);
        project.setEndDateTime(endDateTime);
        project.setStartDateTime(startDateTime);
        projectRepository.save(project);
        return Message.success();
    }


    @RequestMapping("info/{pid}")
    public String inf(@PathVariable("pid") String pid, Model model) {
        Project project = projectRepository.findOne(pid);
        Set<ProjectEquMap> projectEquMaps = project.getProjectEquMaps();
        model.addAttribute("pm", projectEquMaps);
        model.addAttribute("project", project);
        Set<Equipment> equipments = project.getCourse().getLaboratory().getEquipments();
        model.addAttribute("equipments", equipments);
        return "manager/project/projectinfo";
    }

    @RequestMapping("equip/delete/{epid}")
    @ResponseBody
    public Object delete(@PathVariable("epid") String epid) {
        projectEqpMapRepository.delete(epid);
        return Message.success();
    }


    @RequestMapping("addequip/{projectId}")
    @ResponseBody
    @Transactional
    public Object addeqp(@PathVariable("projectId") String pid, String equipId, Integer count) {
        Project project = projectRepository.findOne(pid);
        ProjectEquMap projectEquMap = projectEqpMapRepository.findOneByEquipment_UuidAndProject_Uuid(equipId, pid);
        if (projectEquMap == null) {
            projectEquMap = new ProjectEquMap();
            projectEquMap.setCount(count);
            Equipment equipment = equipmentRepository.findOne(equipId);
            projectEquMap.setEquipment(equipment);
            projectEquMap.setProject(project);

        } else {
            projectEquMap.setCount(count);
        }
        projectEqpMapRepository.save(projectEquMap);

        return Message.success();
    }


    @RequestMapping(value = "changecount", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public Object changeCount(String pid, Integer pcount) {
        ProjectEquMap projectEquMap = projectEqpMapRepository.findOne(pid);
        projectEquMap.setCount(pcount);
        projectEqpMapRepository.save(projectEquMap);
        return Message.success();
    }


    @RequestMapping(value = "publish/{pid}", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public Object publish(@PathVariable("pid") String pid) {
        Project project = projectRepository.findOne(pid);
        project.setStatus(1);
        projectRepository.save(project);
        Set<ProjectEquMap> equMaps = project.getProjectEquMaps();

        for (ProjectEquMap map:equMaps){
            Integer count = map.getCount();
            Equipment equipment = map.getEquipment();
            equipment.setBorrowdCount(equipment.getBorrowdCount()+count);
            equipment.setUsefullCount(equipment.getUsefullCount()-count);
            equipmentRepository.save(equipment);
        }
        return Message.success();
    }

    @RequestMapping(value = "start/{pid}", method = RequestMethod.POST)
    @ResponseBody
    public Object startObject(@PathVariable("pid") String pid) {
        Project project = projectRepository.findOne(pid);
        project.setStatus(2);
        projectRepository.save(project);
        return Message.success();
    }

    @RequestMapping(value = "end/{pid}", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public Object end(@PathVariable("pid") String pid) {
        Project project = projectRepository.findOne(pid);
        project.setStatus(3);
        projectRepository.save(project);
        Set<ProjectEquMap> maps = project.getProjectEquMaps();
        for (ProjectEquMap map:maps){
            Integer count = map.getCount();
            Equipment equipment = map.getEquipment();
            equipment.setUsefullCount(equipment.getUsefullCount()+count-map.getBroken());
            equipment.setBorrowdCount(equipment.getBorrowdCount()-count);
            equipment.setBrokenCount(equipment.getBrokenCount()+map.getBroken());
            equipmentRepository.save(equipment);
        }

        return Message.success();
    }


    @RequestMapping("reports/{projectid}")
    public String ps(@PathVariable("projectid") String pid, Model model) {
        Project project = projectRepository.findOne(pid);
        Set<Student> students = project.getCourse().getStudents();
        model.addAttribute("students", students);
        model.addAttribute("project", project);
        List<Report> reports = reportRepository.findByPid(pid);
        model.addAttribute("reports", reports);
        return "manager/project/reports";
    }


    @Autowired
    ReportRepository reportRepository;

    @RequestMapping("report/download/{stuid}/{pid}")
    public Object export(@PathVariable("stuid") String stuid, @PathVariable("pid") String pid) throws IOException {

        List<Report> reports = reportRepository.findByPidAndSid(pid, stuid);

        if (reports.size() > 0) {
            Report report = reports.remove(0);
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.setContentDispositionFormData("attachment", report.getName());
            return new ResponseEntity<byte[]>(report.getReport(), headers, HttpStatus.CREATED);
        } else {
            return "没有提交实验报告";
        }
    }

    @RequestMapping(value = "doscore",method = RequestMethod.POST)
    @ResponseBody
    public Object doscore(@RequestParam("pid") String pid,@RequestParam("stuid")String stuId,@RequestParam("score") Integer score){

        List<Report> reports = reportRepository.findByPidAndSid(pid, stuId);
        Report report;
        if (reports.size()>0){
             report = reports.remove(0);
            report.setScore(score);
        }else {
             report = new Report();
            report.setPid(pid);
            report.setSid(stuId);
            report.setScore(score);
        }
            reportRepository.save(report);
        return new Message(HttpStatus.OK.value(),"评分成功");
    }


    @RequestMapping(value = "broken",method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public Object broken(@RequestParam("broken") Integer broken,
                         @RequestParam("mapid") String mapid){
        ProjectEquMap one = projectEqpMapRepository.findOne(mapid);
        one.setBroken(broken);
        projectEqpMapRepository.save(one);
        return Message.success();
    }


}
