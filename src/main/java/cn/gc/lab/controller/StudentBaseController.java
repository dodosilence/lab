package cn.gc.lab.controller;

import cn.gc.lab.entity.*;
import cn.gc.lab.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tristan on 16/5/1.
 */

@Controller
@RequestMapping("student")
public class StudentBaseController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    TeacherRepository teacherRepository;
    @Autowired
    ProjectRepository projectRepository;

    @Autowired
    StudentRepository studentRepository;

    @RequestMapping("course/list/{userId}")
    public String course(@PathVariable("userId") String userid, Model model) {
        Student student = studentRepository.findOneByUser_Uuid(userid);
        model.addAttribute("courses", student.getCourses());
        return "teacher/course/course";
    }


    @RequestMapping("project/list/{userId}")
    public String project(@PathVariable("userId") String userid, Model model) {
        Student student = studentRepository.findOneByUser_Uuid(userid);
        model.addAttribute("courses", student.getCourses());
        ArrayList<Project> projects = new ArrayList<Project>();
        for (Course c : student.getCourses()) {
            projects.addAll(c.getProjects());
        }
        model.addAttribute("projects", projects);
        return "teacher/project/project";
    }

    @Autowired
    ReportRepository reportRepository;

    @RequestMapping(value = "project/report", method = RequestMethod.POST)
    @Transactional
    public String  report(HttpServletRequest request,@RequestParam("report") CommonsMultipartFile report, @RequestParam("pid") String pid, @RequestParam("sid") String sid) {

        Student student = studentRepository.findOneByUser_Uuid(sid);

        List<Report> r=reportRepository.findByPidAndSid(pid,student.getUuid());
        if (r!=null){
            for (Report s:r) {
                reportRepository.delete(s.getUuid());
            }
        }
        Report re = new Report();
        re.setPid(pid);
        re.setSid(student.getUuid());
        re.setReport(report.getFileItem().get());
        re.setName(report.getFileItem().getName());
        reportRepository.save(re);
        return "redirect:/mgr/project/info/"+pid;
    }
}
