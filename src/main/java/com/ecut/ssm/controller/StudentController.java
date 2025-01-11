package com.ecut.ssm.controller;

import com.ecut.ssm.entity.Student;
import com.ecut.ssm.service.StudentService;
import com.ecut.ssm.service.SelectedCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    
    @Autowired
    private SelectedCourseService selectedCourseService;

    // 跳转到登录页面
    @GetMapping("/loginPage")
    public String loginPage() {
        return "student/login";
    }

    // 跳转到注册页面
    @GetMapping("/registerPage")
    public String registerPage() {
        return "student/register";
    }

    // 学生登录
    @PostMapping("/login")
    public String login(String stuId, String password, HttpSession session, Model model) {
        Student student = studentService.login(stuId, password);
        if (student != null) {
            session.setAttribute("student", student);
            return "redirect:/student/info";
        }
        model.addAttribute("msg", "学号或密码错误");
        return "student/login";
    }

    // 学生注册
    @PostMapping("/register")
    public String register(Student student, Model model) {
        try {
            // 先检查学号是否存在
            if (studentService.isStuIdExists(student.getStuId())) {
                model.addAttribute("msg", "注册失败：该学号已被注册");
                return "student/register";
            }
            
            if (studentService.registerStudent(student)) {
                return "redirect:/student/loginPage";
            }
            model.addAttribute("msg", "注册失败");
        } catch (Exception e) {
            model.addAttribute("msg", "注册失败：" + e.getMessage());
        }
        return "student/register";
    }

    private void showError(String message, Model model) {
        model.addAttribute("msg", message);
    }

    // 显示学生个人信息
    @GetMapping("/info")
    public String showInfo(HttpSession session, Model model) {
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            return "redirect:/student/loginPage";
        }
        model.addAttribute("student", student);
        return "student/info";
    }

    // 显示学生选课信息
    @GetMapping("/courses")
    public String showCourses(HttpSession session, Model model, 
                            @RequestParam(required = false) String keyword) {
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            return "redirect:/student/loginPage";
        }
        
        List courses = keyword == null ? 
            selectedCourseService.getStudentCourses(student.getStuId()) :
            selectedCourseService.searchStudentCourses(student.getStuId(), keyword);
        
        model.addAttribute("courses", courses);
        return "student/courses";
    }

    // 退出登录
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    // 检查学号是否存在
    @GetMapping("/checkStuId")
    @ResponseBody
    public String checkStuId(@RequestParam String stuId) {
        return String.valueOf(studentService.isStuIdExists(stuId));
    }
} 