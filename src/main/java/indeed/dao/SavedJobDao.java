package indeed.dao;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import indeed.model.JobApplication;
import indeed.model.SavedJob;

@Repository
public class SavedJobDao implements SavedJobDaoInterface{
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void saveJob(SavedJob savedJob) {
		hibernateTemplate.save(savedJob);
		
	}

	@Override
	public List<SavedJob> getSavedJobsByJobSeekerId(int jobSeekerId) {
		String hql = "FROM SavedJob sj WHERE sj.jobSeeker.id = ?";
        return (List<SavedJob>) hibernateTemplate.find(hql, jobSeekerId);
	}

	@Override
	public boolean exists(int savedJobId) {
		SavedJob savedJob = hibernateTemplate.get(SavedJob.class, savedJobId);
        return savedJob != null;
	}

	@Override
	public void delete(int savedJobId) {
		SavedJob savedJob = hibernateTemplate.load(SavedJob.class, savedJobId);
        if (savedJob != null) {
            hibernateTemplate.delete(savedJob);
        }
		
	}
	
	@Override
	 public SavedJob getSavedJobByJobId(int jobId) {
	        String query = "FROM SavedJob WHERE job.jobId = ?";
	        List<SavedJob> savedJobApplications = (List<SavedJob>) hibernateTemplate.find(query, jobId);
	        return savedJobApplications.isEmpty() ? null : savedJobApplications.get(0);
	 }
	 
	@Override
	 public List<SavedJob> getSavedJobByJobSeekerId(int jobSeekerId) {
	        String query = "FROM SavedJob WHERE jobSeeker.jobSeekerId = ?";
	        return (List<SavedJob>) hibernateTemplate.find(query, jobSeekerId);
	 }
	 
	@Override
	 public boolean doesSavedJobExist(int jobId, int jobseekerId) {
			List<SavedJob> savedJobApplications = this.getSavedJobByJobSeekerId(jobseekerId);
			SavedJob savedJobApplication = this.getSavedJobByJobId(jobId);
			
			if(savedJobApplications == null || savedJobApplication == null)
				return false;
			
			for(SavedJob j : savedJobApplications) {
				if(j.getJob().getJobId() == savedJobApplication.getJob().getJobId()) {
					return true;
				}
			}
			
			return false;
		}
	
	

}
