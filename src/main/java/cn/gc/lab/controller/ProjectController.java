package cn.gc.lab.controller;

import antlr.debug.MessageAdapter;
import cn.gc.lab.controller.messagge.Message;
import cn.gc.lab.entity.Course;
import cn.gc.lab.entity.Equipment;
import cn.gc.lab.entity.Project;
import cn.gc.lab.entity.ProjectEquMap;
import cn.gc.lab.repository.CourseRepository;
import cn.gc.lab.repository.EquipmentRepository;
import cn.gc.lab.repository.ProjectEqpMapRepository;
import cn.gc.lab.repository.ProjectRepository;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.objenesis.instantiator.basic.ObjectStreamClassInstantiator;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String list(Model model){
        List<Project> projects = projectRepository.findAll();
        model.addAttribute("projects",projects);
        List<Course> courses = courseRepository.findAll();
        model.addAttribute("courses",courses);
        return "manager/project/project";

    }



    @RequestMapping(value = "/create",method = RequestMethod.POST)
    @ResponseBody
    public Object create(String projectName, String course, @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") Date endDateTime,
                         @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") Date startDateTime){
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
    public String inf(@PathVariable("pid") String pid, Model model){
        Project project = projectRepository.findOne(pid);
        Set<ProjectEquMap> projectEquMaps = project.getProjectEquMaps();
        model.addAttribute("pm",projectEquMaps);
        model.addAttribute("project",project);
        Set<Equipment> equipments = project.getCourse().getLaboratory().getEquipments();
        model.addAttribute("equipments",equipments);
        return "manager/project/projectinfo";
    }

    @RequestMapping("equip/delete/{epid}")
    @ResponseBody
    public Object delete(@PathVariable("epid") String epid){
        projectEqpMapRepository.delete(epid);
        return Message.success();
    }


    @RequestMapping("addequip/{projectId}")
    @ResponseBody
    @Transactional
    public Object addeqp(@PathVariable("projectId") String pid ,String equipId,Integer count){
        Project project = projectRepository.findOne(pid);
        ProjectEquMap projectEquMap=projectEqpMapRepository.findOneByEquipment_UuidAndProject_Uuid(equipId,pid);
        if (projectEquMap==null){
            projectEquMap=new ProjectEquMap();
            projectEquMap.setCount(count);
            Equipment equipment = equipmentRepository.findOne(equipId);
            projectEquMap.setEquipment(equipment);
            projectEquMap.setProject(project);

        }else {
            projectEquMap.setCount(count);
        }
        projectEqpMapRepository.save(projectEquMap);

        return  Message.success();
    }





    @RequestMapping(value = "changecount",method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public Object changeCount(String pid,Integer pcount){
        ProjectEquMap projectEquMap = projectEqpMapRepository.findOne(pid);
        projectEquMap.setCount(pcount);
        projectEqpMapRepository.save(projectEquMap);
        return  Message.success();
    }






}
