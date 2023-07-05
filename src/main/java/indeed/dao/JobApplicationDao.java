package indeed.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import indeed.model.JobApplication;


@Repository
public class JobApplicationDao implements JobApplicationDaoInterface {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	@Autowired
	private SessionFactory sessionFactory;
	
	
	public void sendApplication(JobApplication application) {
		this.hibernateTemplate.save(application);
	}
	
	@Override
	 public List<JobApplication> getJobApplicationsByEmployerId(int employerId) {
	        try (Session session = sessionFactory.openSession()) {
	            Query<JobApplication> query = session.createQuery("FROM JobApplication WHERE employer.id = :employerId", JobApplication.class);
	            query.setParameter("employerId", employerId);
	            return query.getResultList();
	        }
	 }
	 
	@Override
	 public List<JobApplication> getJobApplicationsByStatus(String status) {
	        try (Session session = sessionFactory.openSession()) {
	            Query<JobApplication> query = session.createQuery("FROM JobApplication WHERE status = :status", JobApplication.class);
	            query.setParameter("status", status);
	            return query.getResultList();
	        }
	 }
	 
	@Override
	 public JobApplication getJobApplicationById(int jobApplicationId) {
		    return hibernateTemplate.get(JobApplication.class, jobApplicationId);
	 }
	 
	@Override
	 public void updateTheApplication(JobApplication jobApplication) {
		 hibernateTemplate.update(jobApplication);
	 }

	@Override
	public boolean doesJobApplicationExist(int jobId, int jobseekerId) {
		List<JobApplication> jobApplications = this.getJobApplicationsByJobSeekerId(jobseekerId);
		JobApplication jobApplication = this.getJobApplicationByJobId(jobId);
		
		if(jobApplication == null || jobApplications == null)
			return false;
		
		for(JobApplication j : jobApplications) {
			if(j.getJob().getJobId() == jobApplication.getJob().getJobId()) {
				return true;
			}
		}
		
		return false;
	}
	
	@Override
	 public List<JobApplication> getJobApplicationsByJobSeekerId(int jobSeekerId) {
	        String query = "FROM JobApplication WHERE jobSeeker.jobSeekerId = ?";
	        return (List<JobApplication>) hibernateTemplate.find(query, jobSeekerId);
	 }
	 
	@Override
	 public JobApplication getJobApplicationByJobId(int jobId) {
	        String query = "FROM JobApplication WHERE job.jobId = ?";
	        List<JobApplication> jobApplications = (List<JobApplication>) hibernateTemplate.find(query, jobId);
	        return jobApplications.isEmpty() ? null : jobApplications.get(0);
	 }
}
