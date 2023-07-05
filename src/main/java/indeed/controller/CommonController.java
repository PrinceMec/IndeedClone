package indeed.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import indeed.model.Job;
import indeed.service.JobService;

@Controller
public class CommonController {
	
	@Autowired
	private JobService jobService;
	
	@RequestMapping("/signup-option-page")
	public String signupOptions() {
		return "signup-option-page";
	}
	
	@RequestMapping("/login-option-page")
	public String loginOptions() {
		return "login-option-page";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.invalidate();
		List<Job> jobs = jobService.getAllJobs();
		model.addAttribute("jobs",jobs);
		return "jobseeker-dashboard";
	}
}
