package indeed.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import indeed.dao.JobDao;
import indeed.dao.JobSeekerDao;
import indeed.model.Job;
import indeed.model.JobSeeker;

@Service
public class JobService {
	
	@Autowired
	private JobDao jobDao;
	
	@Transactional
	public int createJob(Job job) {
		return this.jobDao.saveJob(job);
	}
	
	public List<Job> getAllJobs() {
		return this.jobDao.getAllJobs();
	}
	
	public Job getJobById(int jobId) {
		return this.jobDao.getJobById(jobId);
	}
	
	public List<Job> getJobByEmployer(int employerId) {
		return this.jobDao.getJobByEmployerId(employerId);
	}
	
	public List<Job> searchByTitleAndCity(String title, String city) {
		return this.jobDao.searchByTitleAndCity(title, city);
	}
	
	public List<Job> searchByTitleAndEmployer(String title, int employerId) {
		return this.jobDao.searchByTitleAndEmployer(title, employerId);
	}
}
