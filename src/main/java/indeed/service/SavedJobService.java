package indeed.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import indeed.dao.SavedJobDao;
import indeed.model.SavedJob;

@Service
public class SavedJobService {
	
	@Autowired
	private SavedJobDao savedJobDao;
	
	@Transactional
	public void saveJob(SavedJob savedJob) {
		savedJobDao.saveJob(savedJob);
	}
	
	public List<SavedJob> getSavedJobsByJobSeekerId(int jobSeekerId) {
		return savedJobDao.getSavedJobsByJobSeekerId(jobSeekerId);
	}
	
	public boolean exists(int savedJobId) {
		return savedJobDao.exists(savedJobId);
	}
	
	@Transactional
	public void delete(int savedJobId) {
		savedJobDao.delete(savedJobId);
	}
	
	public boolean doesSavedJobExist(int jobId, int jobseekerId) {
		return savedJobDao.doesSavedJobExist(jobId, jobseekerId);
	}
}
