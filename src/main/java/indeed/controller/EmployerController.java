package indeed.controller;
import java.util.HashMap;

import java.util.Map;
import java.util.*;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpStatus;
import org.springframework.core.io.InputStreamResource;





import indeed.model.Employer;
import indeed.model.Job;
import indeed.model.JobApplication;
import indeed.service.EmployerService;
import indeed.service.JobApplicationService;
import indeed.service.JobService;

@Controller
public class EmployerController {
	
	@Autowired
	private EmployerService employerService;
	@Autowired
	private JobService jobService;
	@Autowired
	private JobApplicationService jobApplicationService;
	private boolean isRegister = false;
	
	
	@PostMapping("/check-email")
    @ResponseBody
    public String checkEmailExists(@RequestParam("email") String email) {
        // Perform the email existence check in the database using the UserService
        boolean emailExists = employerService.checkIfEmailExists(email);
        System.out.println("Does email exists: " + emailExists);

        if (emailExists) {
            return "exists"; // Return "exists" if the email exists in the database
        } else {
            return "available"; // Return "available" if the email is not found in the database
        }
    }

	
	@RequestMapping(value = "/downloadPdf", method = RequestMethod.GET, produces = "application/pdf")
	public ResponseEntity<byte[]> downloadPdf(@RequestParam("jobApplicationId") int jobApplicationId) {
	    JobApplication jobApplication = jobApplicationService.getJobApplicationById(jobApplicationId);
	    if (jobApplication != null && jobApplication.getResumePDf() != null) {
	        byte[] pdfData = jobApplication.getResumePDf();

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentDisposition(ContentDisposition.builder("inline").filename("resume.pdf").build());

	        return ResponseEntity.ok()
	                .headers(headers)
	                .body(pdfData);
	    }

	    return ResponseEntity.notFound().build();
	}



	
	@RequestMapping("/candidates")
	public String candidatesView(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Employer employer = (Employer)session.getAttribute("employer");
		
		List<JobApplication> jobApplications = jobApplicationService.getJobApplicationsByStatus("Awaitingreview");
		model.addAttribute("jobApplications", jobApplications);
		
		return "candidates";
	}
	
	@RequestMapping("/edit-employer-profile")
	public String editProfileView(HttpServletRequest request, @RequestParam("employerId") int employerId) {
		HttpSession session = request.getSession();
		Employer employer = employerService.getEmployerById(employerId);
		session.setAttribute("employer", employer);
		return "edit-employer-profile";
	}
	
	@RequestMapping(path="/profile-updated", method=RequestMethod.POST)
	public String editProfile(@ModelAttribute Employer employer,HttpServletRequest request ) {
		HttpSession session = request.getSession();
		Employer employerBeforeEdit = (Employer)session.getAttribute("employer");
		System.out.println("Before" + employerBeforeEdit);
		
		if(!employer.getCompanyName().equals(""))
			employerBeforeEdit.setCompanyName(employer.getCompanyName());
		
		if(!employer.getEmail().equals(""))
			employerBeforeEdit.setEmail(employer.getEmail());
		
		if(!employer.getName().equals(""))
			employerBeforeEdit.setName(employer.getName());
		
		if(!employer.getNumberOfEmployees().equals("")) 
			employerBeforeEdit.setNumberOfEmployees(employer.getNumberOfEmployees());
		
		if(!employer.getPassword().equals(""))
			employerBeforeEdit.setPassword(employer.getPassword());
		
		if(!employer.getPhoneNumber().equals(""))
			employerBeforeEdit.setPhoneNumber(employer.getPhoneNumber());
		
		
		System.out.println("After" + employerBeforeEdit);
		
		employerService.updateEmployer(employerBeforeEdit);
		return "employer-dashboard";
	}
	
	
	
	@RequestMapping("/jobs-posted-by-employer-page")
	public String jobs(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		Employer employer = (Employer) session.getAttribute("employer");
		
		List<Job> jobs = jobService.getJobByEmployer(employer.getEmployerId());
		
		if(jobs.size() == 0)
			model.addAttribute("listStatus", "empty");
		
		model.addAttribute("employerJobs", jobs);
		model.addAttribute("employer", employer);
		return "jobs-posted-by-employer-page";
	}
	
	@RequestMapping("/employer-registration")
	public String registration() {
		isRegister = false;
		return "employer-registration";
	}
	
	@RequestMapping("/employer-login-page")
	public String login() {
		return "employer-login-page";
	}
	
	
	 
	@RequestMapping(path = "/employer-registration-successful", method=RequestMethod.POST)
	public String dashboardAfterRegistration(@ModelAttribute Employer employer, HttpServletRequest request ) {
		HttpSession session = request.getSession();
		
		
		
		if(!isRegister) {
			this.employerService.createEmployer(employer);
			isRegister = true;
			session.setAttribute("employer", employer);
			employer = new Employer();
		}
		
		return "employer-dashboard";
	}
	
	@RequestMapping("/go-to-employer-dashboard")
	public String dashboardView(HttpServletRequest request) {
		
		return "employer-dashboard";
	}
	
	
	
	@RequestMapping("/employer-dashboard")
	public String dashboard() {
		
		return "employer-dashboard";
	}
	
	
	@PostMapping("/login")
	@ResponseBody
	public ResponseEntity<String> login(@RequestParam("email") String email, @RequestParam("password") String password, HttpServletRequest request) {
		System.out.println("Inside login function");
	    // Perform server-side validation
	    if (email.isEmpty() || password.isEmpty()) {
	        return ResponseEntity.badRequest().body("empty_fields");
	    }

	    // Check if the email and password combination is valid
	    if (!employerService.login(email, password)) {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("invalid_email_password");
	    }

	    HttpSession session = request.getSession();
		
		Employer employer = this.employerService.getEmployerByEmail(email);
		//System.out.println(employer);
		
		session.setAttribute("employer", employer);
	    return ResponseEntity.ok("Login successful");
	}


}
