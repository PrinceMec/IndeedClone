package indeed.dao;

import java.util.List;


import indeed.model.JobApplication;

public interface JobApplicationDaoInterface {
	
	public void sendApplication(JobApplication application);
	
	public List<JobApplication> getJobApplicationsByEmployerId(int employerId);
	
	public List<JobApplication> getJobApplicationsByStatus(String status);
	
	public JobApplication getJobApplicationById(int jobApplicationId);
	
	public void updateTheApplication(JobApplication jobApplication);
	
	public boolean doesJobApplicationExist(int jobId, int jobseekerId);
	
	public List<JobApplication> getJobApplicationsByJobSeekerId(int jobSeekerId);
	
	public JobApplication getJobApplicationByJobId(int jobId);
}
