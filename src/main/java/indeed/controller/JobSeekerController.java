package indeed.controller;

import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.enterprise.context.RequestScoped;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import indeed.dao.JobSeekerDao;
import indeed.model.Address;
import indeed.model.Education;
import indeed.model.Job;
import indeed.model.JobSeeker;
import indeed.model.RecentSearch;
import indeed.model.WorkExperience;
import indeed.service.JobSeekerService;
import indeed.service.JobService;
import indeed.service.RecentSearchService;



@Controller
public class JobSeekerController {
	
	@Autowired
	private JobSeekerService jobSeekerService;
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	private RecentSearchService recentSearchService;
	
	private JobSeeker jobseeker = new JobSeeker();
	Set<Education> educations = new HashSet();
	Set<WorkExperience> workExperience = new HashSet();
	private boolean isRegistrated = false;
	
	@PostMapping("/check-email-for-jobseeker")
    @ResponseBody
    public String checkEmailAvailability(@RequestParam("email") String email) {
        // Check if email exists in the database
		//System.out.println("Helloooooo");
        boolean emailExists = jobSeekerService.checkIfEmailExists(email);
        //System.out.println("Does email exists for jobseeker: " + emailExists);
        if (emailExists) {
            return "exists";
        } else {
            return "not exists";
        }
    }
	
	
	@GetMapping("/job-feed")
	public String getJobFeed(Model model) {
	  
	  
      List<Job> jobs = jobService.getAllJobs(); 
      model.addAttribute("jobs", jobs);
      System.out.println("getJobFeed() function called!"); 
	  return "job-feed";
	}

	@RequestMapping("/recent-searches")
	public String getRecentSearches(Model model, HttpServletRequest request) {
		
	  HttpSession session = request.getSession();
	  JobSeeker jobseeker = (JobSeeker)session.getAttribute("jobseeker");
	  //System.out.println(jobseeker);
	  List<RecentSearch> recentSearch = recentSearchService.getAllSearches(jobseeker.getJobSeekerId());
	  
	  List<RecentSearch> recentSearchReverse = new ArrayList<>();
	  int count = 0;
	  
	  for(int i = recentSearch.size() - 1; i>=0; i--) {
		  recentSearchReverse.add(recentSearch.get(i));
		  count++;
		  
		  if(count > 10)
			  break;
	  }
	  
	  model.addAttribute("recentSearches", recentSearchReverse);
	  System.out.println("getRecentSearches() function called!");
	  return "recent-searches"; // Return the name of the JSP view for the recent searches
	}
	
	
	@RequestMapping("/profile-saved")
	public String profileSaved(@RequestParam("jobSeekerId") int jobSeekerId,
								@RequestParam("firstName") String firstName,
								@RequestParam("lastname") String lastname,
								@RequestParam("email") String email,
								@RequestParam("password") String password,
								@RequestParam("phoneNumber") Long phoneNumber, HttpServletRequest request , Model model) {
		
		JobSeeker jobSeeker = jobSeekerService.getJobSeekerById(jobSeekerId);
		System.out.println("Firstname: " +firstName);
		if(!firstName.equals(""))
			jobSeeker.setFirstName(firstName);
		if(lastname.equals(""))
			jobSeeker.setLastname(lastname);
		if(email.equals(""))
			jobSeeker.setEmail(email);
		if(password.equals(""))
			jobSeeker.setPassword(password);
		if(phoneNumber != null)
			jobSeeker.setPhoneNumber(phoneNumber);
		
		HttpSession session = request.getSession();
		jobSeekerService.updateJobSeeker(jobSeeker);
		
		session.removeAttribute("jobseeker"); 
		session.setAttribute("jobseeker",jobSeeker);
		List<Job> jobs = jobService.getAllJobs();
		model.addAttribute("jobs",jobs);
		 
		return "jobseeker-dashboard";
	}
	
	@RequestMapping("/edit-jobseeker-profile")
	public String editProfile(Model model, HttpServletRequest request) {
		JobSeeker jobseeker = (JobSeeker)request.getSession().getAttribute("jobseeker");
		JobSeeker jobseekerForModel = jobSeekerService.getJobSeekerById(jobseeker.getJobSeekerId());
		model.addAttribute("jobseeker", jobseekerForModel);
		return "edit-jobseeker-profile";
	}
	
	@RequestMapping("/jobseeker-login-page")
	public String login() {
		return "jobseeker-login-page";
	}
	
	@RequestMapping("/jobseeker-dashboard")
	public String dashboard(Model model) {
		List<Job> jobs = jobService.getAllJobs();
		model.addAttribute("jobs",jobs);
		return "jobseeker-dashboard";
	}
	
	
	@RequestMapping("/go-to-jobseeker-dashboard")
	public String loginSuccessfull(HttpServletRequest request, Model model) {
		
		
		List<Job> jobs = jobService.getAllJobs();
		model.addAttribute("jobs",jobs);
		
		
		return "jobseeker-dashboard";
	}
	
	@PostMapping("/validate-login")
	@ResponseBody
	public String validateLogin(@RequestParam("email") String email, @RequestParam("password") String password, HttpServletRequest request, Model model) {
	    // Perform validation logic by checking the email and password in the database
		JobSeeker jobseeker = jobSeekerService.login(email, password);
		
		 if (jobseeker != null) {
			 HttpSession session = request.getSession();
			 List<Job> jobs = jobService.getAllJobs();
			 model.addAttribute("jobs",jobs);
			 session.setAttribute("jobseeker", jobseeker);
			 System.out.println(jobseeker);
		     return "valid";
		 } else {
		     return "invalid";
		 }
		
	}

	
	
	
	@RequestMapping("/jobseeker-registration-page0") 
	public String registrationPage0View() {
		
		return "jobseeker-registration-page0";
	}
	
	//firstname and lastname
	@RequestMapping("/jobseeker-registration-page1") 
	public String handleRegistrationPage0Data(@RequestParam("email") String email, @RequestParam("password") String password) {
		isRegistrated = false;
		jobseeker.setEmail(email);
		jobseeker.setPassword(password);
		return "jobseeker-registration-page1";
	}
	
	//phone number
	@RequestMapping(path="/jobseeker-registration-page2", method=RequestMethod.POST) 
	public String handleRegistrationPage1Data(@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName) {
		jobseeker.setFirstName(firstName);
		jobseeker.setLastname(lastName);
		System.out.println(firstName);
		return "jobseeker-registration-page2";
	}
	
	//address
	@RequestMapping(path="/jobseeker-registration-page3", method=RequestMethod.POST)
	public String handleRegistrationPage2Data(@RequestParam("phoneNumber") String phoneNumber) {
		jobseeker.setPhoneNumber(Long.parseLong(phoneNumber));
		
		return "jobseeker-registration-page3";
	}
	
	//education
	@RequestMapping(path="/jobseeker-registration-page4", method=RequestMethod.POST)
	public String handleRegistrationPage3Data(@RequestParam("streetAddress") String streetAddress, 
												@RequestParam("country") String country,
												@RequestParam("city") String city,
												@RequestParam("province") String province,
												@RequestParam("postalCode") String postalCode) {
		
		Address address = new Address(streetAddress, city, province, postalCode, country);
		jobseeker.setAddress(address);
		
		return "jobseeker-registration-page4";
	}
	
	//Review education
	@RequestMapping(path="/jobseeker-registration-page5")
	public String handleRegistrationPage4Data(@RequestParam("levelOfEducation") String levelOfEducation, 
												@RequestParam("fieldOfStudy") String fieldOfStudy,
												@RequestParam("schoolName") String schoolName,
												@RequestParam("country") String country,
												@RequestParam("city") String city, 
												@RequestParam("startDate") String startDate,
												@RequestParam("endDate") String endDate, 
												@RequestParam("province") String province, Model model) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date sDate = null;
		try {
			sDate = sdf.parse(startDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date eDate = null;
		try {
			eDate = sdf.parse(endDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Education education = new Education(levelOfEducation, fieldOfStudy, schoolName, country, city, province, sDate, eDate);
		educations.add(education);
		jobseeker.setEducations(educations);
		model.addAttribute("educationList", educations);
		return "jobseeker-registration-page5";
		
	}
	
	//work experience
	@RequestMapping("/jobseeker-registration-page6")
	public String registrationPage6View() {
		return "jobseeker-registration-page6";
	}
	
	//skills
	@RequestMapping(path="/jobseeker-registration-page7", method=RequestMethod.POST)
	public String handleRegistrationPage6Data(@RequestParam("jobTitle") String jobTitle, 
												@RequestParam("company") String company,
												@RequestParam("country") String country,
												@RequestParam("description") String description,
												@RequestParam("city") String city, 
												@RequestParam("startDate") String startDate,
												@RequestParam("endDate") String endDate, 
												@RequestParam("province") String province) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date sDate = null;
		try {
			sDate = sdf.parse(startDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date eDate = null;
		try {
			eDate = sdf.parse(endDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		WorkExperience experience = new WorkExperience(jobTitle, company, country, city, province,
				sDate, eDate, description);
		workExperience.add(experience);
		jobseeker.setWorkexperience(workExperience);
		
		return "jobseeker-registration-page7";
	}
	
	//certifications
	@RequestMapping(path="/jobseeker-registration-page8", method=RequestMethod.POST)
	public String handleRegistrationPage7Data(@RequestParam("addASkill") String skills) {
		
		String[] skillsArray = skills.split(",");
		Set<String> skillsList = new HashSet();
		for(String skill : skillsArray)
			skillsList.add(skill.trim());
		
		jobseeker.setSkills(skillsList);
		return "jobseeker-registration-page8";
	}
	
	@RequestMapping(path="/jobseeker-registration-page9", method=RequestMethod.POST)
	public String handleRegistrationPage8Data(@RequestParam("certifications") String certifications) {
		
		String[] certificationsArray = certifications.split(",");
		Set<String> certificationsList = new HashSet();
		for(String certificate : certificationsArray)
			certificationsList.add(certificate.trim());
		
		jobseeker.setCertifications(certificationsList);
		
		return "jobseeker-registration-page9";
	}
	
	@RequestMapping("/registration-details")
	public String handleRegistrationPage9Data(@RequestParam("minimumBasePay") float minimumBasePay,
												@RequestParam("desiredJobTitle") String desiredJobTitle,
												 @RequestParam(value = "willingToRelocate", required = false) String willingToRelocate,
												@RequestParam("desiredJobType") Set<String> desiredJobType,
												@RequestParam("desiredWorkSchedule") Set<String> desiredWorkSchedule, Model model) {
												
		jobseeker.setMinimumBasePay(minimumBasePay);
		//System.out.println(willingToRelocate);
		jobseeker.setDesiredJobTitle(desiredJobTitle);
		
		if(willingToRelocate != null) {
			jobseeker.setWillingToRelocate("yes");
		} else {
			jobseeker.setWillingToRelocate("no");
		}
		
		jobseeker.setDesiredJobTypes(desiredJobType);
		jobseeker.setDesiredWorkSchedule(desiredWorkSchedule);
		System.out.println("Testing: " + jobseeker);
		model.addAttribute("jobSeekerObject", jobseeker);
		
		return "registration-details";
	}
	
	@RequestMapping(path = "/profile-ready-page")
	public String profileReadyPage(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		
		if(!isRegistrated) {
			this.jobSeekerService.createJobSeeker(this.jobseeker);
			session.setAttribute("jobseeker", jobseeker);
			jobseeker = new JobSeeker();
			isRegistrated = true;
		}
		
		return "profile-ready-page";
	}
	
	
}
