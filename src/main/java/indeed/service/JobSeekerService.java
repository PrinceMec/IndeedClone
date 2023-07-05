package indeed.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import indeed.dao.JobSeekerDao;
import indeed.model.JobSeeker;

@Service
public class JobSeekerService {
	
	@Autowired
	private JobSeekerDao jobSeekerDao;
	
	@Transactional
	public int createJobSeeker(JobSeeker jobSeeker) {
		return this.jobSeekerDao.saveJobSeeker(jobSeeker);
	}
	
	public JobSeeker login(String email, String password) {
		return jobSeekerDao.login(email, password);
	}
	
	public JobSeeker getJobSeekerById(int jobSeekerId) {
		return this.jobSeekerDao.getJobSeekerById(jobSeekerId);
	}
	
	@Transactional
	public void updateJobSeeker(JobSeeker jobSeeker) {
		this.jobSeekerDao.updateJobSeeker(jobSeeker);
	}
	
	public boolean checkIfEmailExists(String email) {
		return this.jobSeekerDao.checkIfEmailExists(email);
	}
	
}
