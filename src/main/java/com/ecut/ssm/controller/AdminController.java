package com.ecut.ssm.controller;

import com.ecut.ssm.entity.Admin;
import com.ecut.ssm.entity.Student;
import com.ecut.ssm.entity.SelectedCourse;
import com.ecut.ssm.service.AdminService;
import com.ecut.ssm.service.StudentService;
import com.ecut.ssm.service.SelectedCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;
    
    @Autowired
    private StudentService studentService;
    
    @Autowired
    private SelectedCourseService selectedCourseService;

    // 跳转到登录页面
    @GetMapping("/loginPage")
    public String loginPage() {
        return "admin/login";
    }

    // 管理员登录
    @PostMapping("/login")
    public String login(String adminId, String password, HttpSession session, Model model) {
        Admin admin = adminService.login(adminId, password);
        if (admin != null) {
            session.setAttribute("admin", admin);
            return "redirect:/admin/info";
        }
        model.addAttribute("msg", "账号或密码错误");
        return "admin/login";
    }

    // 显示管理员信息
    @GetMapping("/info")
    public String showInfo(HttpSession session, Model model) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/admin/loginPage";
        }
        model.addAttribute("admin", admin);
        return "admin/info";
    }

    // 显示所有学生信息
    @GetMapping("/students")
    public String showStudents(Model model, @RequestParam(required = false) String keyword) {
        List<Student> students = keyword == null ? 
            studentService.getAllStudents() : 
            studentService.searchStudents(keyword);
        model.addAttribute("students", students);
        return "admin/students";
    }

    // 删除学生
    @PostMapping("/student/delete/{stuId}")
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public String deleteStudent(@PathVariable String stuId) {
        if (!selectedCourseService.canDeleteStudent(stuId)) {
            return new String("该学生还有选课记录，无法删除".getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
        }
        return studentService.deleteStudent(stuId) ? "success" : "删除失败";
    }

    // 显示学生选课信息
    @GetMapping("/student/courses/{stuId}")
    public String showStudentCourses(@PathVariable String stuId, Model model,
                                   @RequestParam(required = false) String keyword) {
        List<SelectedCourse> courses = keyword == null ?
            selectedCourseService.getStudentCourses(stuId) :
            selectedCourseService.searchStudentCourses(stuId, keyword);
        model.addAttribute("courses", courses);
        model.addAttribute("stuId", stuId);
        return "admin/studentCourses";
    }

    // 删除选课记录
    @PostMapping("/course/delete")
    @ResponseBody
    public String deleteCourse(String courseId, String stuId) {
        return selectedCourseService.deleteSelectedCourse(courseId, stuId) ? 
            "success" : "删除失败";
    }

    // 退出登录
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    // 跳转到添加学生页面
    @GetMapping("/student/add")
    public String showAddStudentPage() {
        return "admin/student/add";
    }

    // 添加学生
    @PostMapping("/student/add")
    public String addStudent(Student student, Model model) {
        try {
            // 先检查学号是否存在
            if (studentService.isStuIdExists(student.getStuId())) {
                model.addAttribute("msg", "添加失败：该学号已存在");
                return "admin/student/add";
            }
            
            if (studentService.registerStudent(student)) {
                return "redirect:/admin/students";
            }
            model.addAttribute("msg", "添加失败");
        } catch (Exception e) {
            model.addAttribute("msg", "添加失败：" + e.getMessage());
        }
        return "admin/student/add";
    }

    // 跳转到修改学生页面
    @GetMapping("/student/edit/{stuId}")
    public String showEditStudentPage(@PathVariable String stuId, Model model) {
        Student student = studentService.getStudentById(stuId);
        if (student == null) {
            return "redirect:/admin/students";
        }
        model.addAttribute("student", student);
        return "admin/student/edit";
    }

    // 更新学生信息
    @PostMapping("/student/update")
    public String updateStudent(Student student, Model model) {
        try {
            if (studentService.updateStudent(student)) {
                return "redirect:/admin/students";
            }
            model.addAttribute("msg", "更新失败");
        } catch (Exception e) {
            model.addAttribute("msg", "更新失败：" + e.getMessage());
        }
        model.addAttribute("student", student);
        return "admin/student/edit";
    }

    // 跳转到添加选课页面
    @GetMapping("/course/add")
    public String showAddCoursePage(@RequestParam String stuId, Model model) {
        model.addAttribute("stuId", stuId);
        return "admin/course/add";
    }

    // 添加选课信息
    @PostMapping("/course/add")
    public String addCourse(SelectedCourse course, Model model) {
        try {
            if (selectedCourseService.addSelectedCourse(course)) {
                return "redirect:/admin/student/courses/" + course.getStuId();
            }
            model.addAttribute("msg", "添加失败");
        } catch (Exception e) {
            model.addAttribute("msg", "添加失败：" + e.getMessage());
        }
        model.addAttribute("stuId", course.getStuId());
        return "admin/course/add";
    }

    // 跳转到修改选课页面
    @GetMapping("/course/edit")
    public String showEditCoursePage(@RequestParam String courseId, 
                                   @RequestParam String stuId, 
                                   Model model) {
        SelectedCourse course = selectedCourseService.getSelectedCourse(courseId, stuId);
        if (course == null) {
            return "redirect:/admin/student/courses/" + stuId;
        }
        model.addAttribute("course", course);
        return "admin/course/edit";
    }

    // 更新选课信息
    @PostMapping("/course/update")
    public String updateCourse(SelectedCourse course, Model model) {
        try {
            if (selectedCourseService.updateSelectedCourse(course)) {
                return "redirect:/admin/student/courses/" + course.getStuId();
            }
            model.addAttribute("msg", "更新失败");
        } catch (Exception e) {
            model.addAttribute("msg", "更新失败：" + e.getMessage());
        }
        model.addAttribute("course", course);
        return "admin/course/edit";
    }
} 