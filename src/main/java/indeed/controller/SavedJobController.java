package indeed.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import indeed.model.Job;
import indeed.model.JobSeeker;
import indeed.model.SavedJob;
import indeed.service.JobSeekerService;
import indeed.service.JobService;
import indeed.service.SavedJobService;

@Controller
public class SavedJobController {
	
	@Autowired
	private JobService jobService;
	@Autowired
	private JobSeekerService jobseekerService;
	@Autowired
	private SavedJobService savedJobService;
	
	
	@DeleteMapping("/remove-from-saved/{savedJobId}")
	@ResponseBody
	public ResponseEntity<String> removeFromSavedJobs(@PathVariable("savedJobId") int savedJobId) {
	    // Logic to remove the job with the specified savedJobId from the saved jobs list
	    System.out.println("Inside removeFromSavedJobs");
	    System.out.println("ID: " + savedJobId);
	    if(savedJobId > 0)
	    	savedJobService.delete(savedJobId);
	    
	    return ResponseEntity.ok("Job removed successfully");
	}

	
	@PostMapping("/job-searched-results-page")
	public String saveTheJob(@RequestParam("jobId") int jobId, @RequestParam("jobseekerId") int jobseekerId) {
		
		JobSeeker jobseeker = jobseekerService.getJobSeekerById(jobseekerId);
		Job job = jobService.getJobById(jobId);
		SavedJob savedJob = new SavedJob();
		savedJob.setJob(job);
		savedJob.setJobSeeker(jobseeker);
		
		if(!savedJobService.doesSavedJobExist(jobId, jobseekerId)) {
			savedJobService.saveJob(savedJob);
		}
		 
		
		
		return "redirect:/job-searched-results-page";
	}
	
	@RequestMapping("/saved-jobs-lists")
	public String listOfSavedJobs(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		JobSeeker jobseeker = (JobSeeker)session.getAttribute("jobseeker");
		System.out.println("JobSeeker for Saved Job: " + jobseeker);
		List<SavedJob> savedJobList = savedJobService.getSavedJobsByJobSeekerId(jobseeker.getJobSeekerId());
		model.addAttribute("listOfSavedJobs", savedJobList);
		return "saved-jobs";
	}
}
