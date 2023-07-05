package indeed.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import indeed.dao.JobApplicationDao;
import indeed.model.JobApplication;

@Service
public class JobApplicationService {
	
	@Autowired
	private JobApplicationDao jobApplicationDao;
	
	@Transactional
	public void sendApplication(JobApplication jobApplication) {
		this.jobApplicationDao.sendApplication(jobApplication);
	}
	
	public List<JobApplication> getJobApplicationsByEmployerId(int employerId) {
		return this.jobApplicationDao.getJobApplicationsByEmployerId(employerId);
	}
	
	public JobApplication getJobApplicationById(int jobApplicationId) {
	    return jobApplicationDao.getJobApplicationById(jobApplicationId);
	}
	
	public List<JobApplication> getJobApplicationsByStatus(String status) {
		return jobApplicationDao.getJobApplicationsByStatus(status);
	}
	
	@Transactional
	public void updateTheApplication(JobApplication jobApplication) {
		jobApplicationDao.updateTheApplication(jobApplication);
	}
	
	public boolean doesJobApplicationExist(int jobId, int jobseekerId) {
		return jobApplicationDao.doesJobApplicationExist(jobId, jobseekerId);
	}
	
	public List<JobApplication> getJobApplicationsByJobSeekerId(int jobSeekerId) {
		return jobApplicationDao.getJobApplicationsByJobSeekerId(jobSeekerId);
	}

	
}
