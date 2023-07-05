package indeed.controller;

import java.text.ParseException;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import indeed.model.Address;
import indeed.model.Employer;
import indeed.model.Job;
import indeed.model.JobSeeker;
import indeed.model.RecentSearch;
import indeed.service.JobApplicationService;
import indeed.service.JobService;
import indeed.service.RecentSearchService;

@Controller
public class JobController {

	@Autowired
	private JobService jobService;
	
	@Autowired
	private RecentSearchService recentSearchService;
	
	@Autowired
	private JobApplicationService jobApplicationService;
	
	private Job job = new Job();
	private boolean isPosted = false;
	
	@RequestMapping(value = "/jobs/{jobId}", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Job> getJobDetails(@PathVariable("jobId") int jobId) {
		
	    Job job = jobService.getJobById(jobId); 
	    
	    return ResponseEntity.ok(job);
	}
	
	@GetMapping("/search")
	public String searchJobs(@RequestParam(value = "query", defaultValue = "") String query, Model model, HttpServletRequest request) {
	    System.out.println("Inside searchJobs!");
		HttpSession session = request.getSession();
	    Employer employer = (Employer) session.getAttribute("employer");
	    
	    List<Job> filteredJobs;
	    
	    if (query.isEmpty()) {
	        filteredJobs = jobService.getJobByEmployer(employer.getEmployerId());
	    } else {
	        filteredJobs = jobService.searchByTitleAndEmployer(query, employer.getEmployerId());
	    }

	    model.addAttribute("employerJobs", filteredJobs);
	    return "searched-jobs-by-employer";
	}



	@RequestMapping("/job-searched-results-page")
	public String jobSearchedPage(@RequestParam("jobTitle") String jobTitle, @RequestParam("city") String city, Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		JobSeeker jobseeker = (JobSeeker)session.getAttribute("jobseeker");
		//System.out.println(jobseeker);
		model.addAttribute("jobseeker", jobseeker);
		RecentSearch recentSearch = new RecentSearch();
		recentSearch.setCity(city);
		recentSearch.setJobTitle(jobTitle);
		recentSearch.setJobSeeker(jobseeker);
		
		if(!city.equals("") && !jobTitle.equals("") && !jobseeker.equals(null))
			recentSearchService.saveSearch(recentSearch);
		
		List<Job> jobs = jobService.searchByTitleAndCity(jobTitle, city);
		
		
		
		if(jobs.size() == 0)
			model.addAttribute("listStatus", "empty");
		
		
		
		if(!jobTitle.equals("") && !city.equals("")) {
			String results = jobTitle + " jobs in " + city;
			model.addAttribute("results", results);
		} else if(jobTitle.equals("") && !city.equals("")) {
			String results = "All jobs in " + city;
			model.addAttribute("results", results);
		} else if(city.equals("") && !jobTitle.equals("")) {
			String results = jobTitle + " in all cities";
			model.addAttribute("results", results);
		} else {
			String results = "All jobs in all cities";
			model.addAttribute("results", results);
		}
			
		
		
		model.addAttribute("jobs", jobs);
		
		return "job-searched-results-page";
	}

	@RequestMapping("/post-job-page1")
	public String postJobPag1View() {
		isPosted = false;
		return "post-job-page1";
	}

	@RequestMapping(path = "/post-job-page2", method = RequestMethod.POST)
	public String handlePostJobPage1Data(@RequestParam("jobTitle") String jobTitle,
			@RequestParam("jobsLocation") String jobsLocation,
			@RequestParam("streetAddressForJob") String streetAddressForJob, @RequestParam("country") String country,
			@RequestParam("postalCode") String postalCode, @RequestParam("city") String city,
			@RequestParam("province") String province,
			@RequestParam("languageToPerformThisJob") String languageToPerformThisJob,
			@RequestParam("languageTrainingProvided") String languageTrainingProvided) {
		
		Address address = new Address(streetAddressForJob, city, province, postalCode, country);

		//System.out.println(jobTitle);
		job.setJobTitle(jobTitle);
		job.setJobsLocation(jobsLocation);
		job.setAddress(address);
		job.setLanguageToPerformThisJob(languageToPerformThisJob);
		job.setLanguageTrainingProvided(languageTrainingProvided);
		return "post-job-page2";
	}

	@RequestMapping(path = "/post-job-page3", method = RequestMethod.POST)
	public String handlepostPage2Data(@RequestParam("jobType") Set<String> jobType,
			@RequestParam("jobSchedule") Set<String> jobSchedule, @RequestParam("startDate") String startDate,
			@RequestParam("numberlimitForThisRole") String numberlimitForThisRole,
			@RequestParam("howQuicklyDoYouNeedToHire") String howQuicklyDoYouNeedToHire) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date sDate = null;
		try {
			sDate = sdf.parse(startDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		job.setJobType(jobType);
		job.setJobSchedule(jobSchedule);
		job.setStartDate(sDate);
		job.setNumberlimitForThisRole(numberlimitForThisRole);
		job.setHowQuicklyDoYouNeedToHire(howQuicklyDoYouNeedToHire);

		return "post-job-page3";
	}

	@RequestMapping(path = "/post-job-page4", method = RequestMethod.POST)
	public String handlePostJobPage3Data(@RequestParam("minimumPay") float minimumPay,
			@RequestParam("maximumPay") float maximumPay,
			@RequestParam("supplementalPayType") Set<String> supplementalPayType,
			@RequestParam("benefitsOffered") Set<String> benefitsOffered) {

		job.setMinimumPay(minimumPay);
		job.setMaximumPay(maximumPay);
		job.setSupplementalPay(supplementalPayType);
		job.setBenefitsOffered(benefitsOffered);
		return "post-job-page4";
	}

	@RequestMapping(path = "/view-job-details", method = RequestMethod.POST)
	public String handlePostJobPage4Data(@RequestParam("applicationDeadline") String applicationDeadline,
			@RequestParam("jobDescription") String jobDescription, Model model, HttpServletRequest request) {
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dDate = null;
		try {
			dDate = sdf.parse(applicationDeadline);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		job.setApplicationDeadline(dDate);
		job.setJobDescription(jobDescription);

		HttpSession session = request.getSession();
		Employer employer = (Employer) session.getAttribute("employer");
		//System.out.println(employer);
		job.setEmployer(employer);
		model.addAttribute("job", job);
		return "view-job-details";
	}

	@RequestMapping("/job-is-posted-page")
	public String postTheJob() {
		
		if(!isPosted) {
			jobService.createJob(job);
			isPosted = true;
			job = new Job();
		}
		
		return "job-is-posted-page";
	}

}
