package indeed.dao;

import indeed.model.JobSeeker;

public interface JobSeekerDaoInterface {
	
	public int saveJobSeeker(JobSeeker jobseeker);
	
	public JobSeeker login(String email, String password);
	
	public JobSeeker getJobSeekerById(int jobSeekerId);
	
	public void updateJobSeeker(JobSeeker jobSeeker);
	
	public boolean checkIfEmailExists(String email);
	
	
}
