package indeed.dao;

import java.util.List;


import indeed.model.SavedJob;

public interface SavedJobDaoInterface {
	
	public void saveJob(SavedJob savedJob);
	
	public List<SavedJob> getSavedJobsByJobSeekerId(int jobSeekerId);
	
	public boolean exists(int savedJobId);
	
	public void delete(int savedJobId);
	
	public SavedJob getSavedJobByJobId(int jobId);
	
	public List<SavedJob> getSavedJobByJobSeekerId(int jobSeekerId);
	
	public boolean doesSavedJobExist(int jobId, int jobseekerId);
}
