package indeed.dao;

import java.util.List;


import indeed.model.Job;

public interface JobDaoInterface {
	
	public int saveJob(Job job);
	
	public List<Job> getAllJobs();
	
	public Job getJobById(int jobId);
	
	public List<Job> getJobByEmployerId(int employerId);
	
	public List<Job> searchByTitleAndCity(String title, String city);
	
	public List<Job> searchByTitleAndEmployer(String title, int employerId);
}
