package indeed.controller;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import indeed.model.Employer;
import indeed.model.Job;
import indeed.model.JobApplication;
import indeed.model.JobSeeker;
import indeed.service.EmployerService;
import indeed.service.JobApplicationService;
import indeed.service.JobSeekerService;
import indeed.service.JobService;

@Controller
public class JobApplicationController {
	
	@Autowired
	private JobApplicationService jobApplicationService;
	@Autowired
	private JobService jobService;
	@Autowired
	private JobSeekerService jobSeekerService;
	@Autowired
	private EmployerService employerService;

	
	@RequestMapping("/applied-jobs")
	public String appliedJobs(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		JobSeeker jobseeker = (JobSeeker)session.getAttribute("jobseeker");
		//System.out.println(jobseeker);
		List<JobApplication> jobApplications = jobApplicationService.getJobApplicationsByJobSeekerId(jobseeker.getJobSeekerId());
		model.addAttribute("jobApplications", jobApplications);
		return "applied-jobs";
	}
	
	private String getNextStatus(String status) {
		if(status.equals("Awaitingreview"))
			return "ShortList";
		else if(status.equals("ShortList"))
			return "Maybe";
		else if(status.equals("Maybe"))
			return "Hired";
		else if(status.equals("Hired"))
			return "Rejected";
		else if(status.equals("Rejected"))
			return "Awaitingreview";
		
		return "Awaitingreview";
	}
	
	@PostMapping("/moveToNextStatus")
	public ResponseEntity<String> moveToNextStatus(@RequestParam int jobApplicationId) {
	    // Retrieve the job application based on the provided ID
		
	    JobApplication jobApplication = jobApplicationService.getJobApplicationById(jobApplicationId);
	    //System.out.println("Object before updating: " + jobApplication);
	    if (jobApplication != null) {
	        // Move the job application to the next status
	        String currentStatus = jobApplication.getStatus();
	        //System.out.println("CurrentStatus: " + currentStatus);
	        String nextStatus = getNextStatus(currentStatus);
	        //System.out.println("Next Status: " + nextStatus);
	        jobApplication.setStatus(nextStatus);
	        jobApplicationService.updateTheApplication(jobApplication);
	        
	        
	        JobApplication jobApplication2 = jobApplicationService.getJobApplicationById(jobApplicationId);
	        //System.out.println("After updating the status: " + jobApplication2);
	        return ResponseEntity.ok("Success");
	    } else {
	        return ResponseEntity.badRequest().body("Job application not found");
	    }
	}
	
	
	   @GetMapping("/filterJobApplications")
	    public @ResponseBody String filterJobApplications(@RequestParam String status) {
	        // Retrieve the filtered job applications based on the requested status
	        Iterable<JobApplication> filteredJobApplications = jobApplicationService.getJobApplicationsByStatus(status);
	        System.out.println(status);
	        // Generate the HTML markup for the filtered job applications
	        StringBuilder htmlBuilder = new StringBuilder();
	        //htmlBuilder.append("<h2 class=\\\"text-center\\\">").append(status).append("</h2>");
	        for (JobApplication jobApplication : filteredJobApplications) {
	        	
	        	htmlBuilder.append("<div class=\"card\" style=\"margin-left: 210px; width: 1696px; border-radius: 10px; margin-top:7px;\">");
	            htmlBuilder.append("<div class=\"card-body\">");
	            htmlBuilder.append("<h6 style=\"color: rgb(37, 87, 167);\">").append(jobApplication.getJobSeeker().getFirstName()).append(" ").append(jobApplication.getJobSeeker().getLastname()).append("</h6>");
	            htmlBuilder.append("<h8>").append(jobApplication.getJob().getJobTitle()).append("</h8><br>");
	            htmlBuilder.append("<a href=\"downloadPdf?jobApplicationId=").append(jobApplication.getJobApplicationId()).append("\" target=\"_blank\">View resume</a><br>");
	            
	            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMMM-yyyy", Locale.ENGLISH);
	            htmlBuilder.append("<h8>Application date: ").append(dateFormat.format(jobApplication.getApplicationSubmitDate())).append("</h8>");
	            htmlBuilder.append("<button type=\"button\" class=\"btn btn-primary move-btn\" style=\"border-radius:15px; background-color:rgb(37, 87, 167);\" data-job-application-id=\"").append(jobApplication.getJobApplicationId()).append("\">Move to Next status</button>");
	            htmlBuilder.append("</div></div>");
	        }

	        return htmlBuilder.toString();
	    }
	
	@RequestMapping(path="/send-application-page", method=RequestMethod.POST)
	public String reviewApplication(@RequestParam("jobId") int jobId, 
									@RequestParam("employerId") int employerId, 
									@RequestParam("jobseekerId") int jobseekerId, 
									HttpServletRequest request, Model model) {
		
		
		System.out.println("Inside reviewApplication() function by URL /send-application-page");
		HttpSession session = request.getSession();
		JobSeeker jobseeker = (JobSeeker)session.getAttribute("jobseeker");
		model.addAttribute("jobseeker", jobseeker);
		
		//removing the attributes if exists
		session.removeAttribute("jobId");
		session.removeAttribute("employerId");
		session.removeAttribute("jobSeekerId");
		
		session.setAttribute("jobId", jobId);
		session.setAttribute("employerId", employerId);
		session.setAttribute("jobSeekerId", jobseekerId);
		return "send-application-page";
	}
	
	@RequestMapping("/resume-missing")
	public String resumeMissing(Model model, HttpServletRequest request) {
		
		model.addAttribute("resumeMissing", "Please upload your resume.");
		return "send-application-page";
	}
	
	@RequestMapping(path="/application-submitted", method=RequestMethod.POST)
	public String applicationSubmission(@RequestParam("resumePDF") MultipartFile resumePDF, HttpServletRequest request, Model model) throws IOException { 
        
		try {
	        if (resumePDF.isEmpty()) {
	            return "redirect:/resume-missing";
	        }
	        
	        HttpSession session = request.getSession();
    		int jobSeekerId = (Integer)session.getAttribute("jobSeekerId");
    		int employerId = (Integer)session.getAttribute("employerId");
    		int jobId = (Integer)session.getAttribute("jobId");
    		System.out.println(jobId + " " + employerId + " " + jobSeekerId);
    		  
    		JobSeeker jobSeeker = jobSeekerService.getJobSeekerById(jobSeekerId);
    		Employer employer = employerService.getEmployerById(employerId); 
    		Job job = jobService.getJobById(jobId);
    		  
    		JobApplication jobApplication = new JobApplication();
    		jobApplication.setResumePDf(resumePDF.getBytes());
    		jobApplication.setEmployer(employer);
    		jobApplication.setApplicationSubmitDate(new Date());
    		jobApplication.setJob(job);
    		jobApplication.setStatus("Awaitingreview");
    		jobApplication.setJobSeeker(jobSeeker);
    		
    		List<Job> jobs = jobService.getAllJobs();
    		
    		model.addAttribute("jobs", jobs);
    		
    		if(!jobApplicationService.doesJobApplicationExist(jobId, jobSeekerId)) {
    			this.jobApplicationService.sendApplication(jobApplication);
    			System.out.println("Does not exists");
    		}
    		
    		System.out.println("Exists!");
    		return "application-submitted";

	        
	    } catch (IOException e) {
	        // Handle any IOException that may occur
	        return "Error retrieving file bytes: " + e.getMessage();
	    }
		
		
		
		
	}
}
