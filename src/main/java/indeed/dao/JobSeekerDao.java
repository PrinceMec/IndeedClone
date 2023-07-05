package indeed.dao;

import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import indeed.model.Employer;
import indeed.model.JobApplication;
import indeed.model.JobSeeker;

@Repository
public class JobSeekerDao implements JobSeekerDaoInterface {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	@Autowired
	private SessionFactory sessionFactory;
	
	public JobSeekerDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JobSeekerDao(HibernateTemplate hibernateTemplate) {
		super();
		this.hibernateTemplate = hibernateTemplate;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public int saveJobSeeker(JobSeeker jobseeker) {
		Integer rowAffected = (Integer)this.hibernateTemplate.save(jobseeker);
		return rowAffected;
	}
	
	@Override
	public JobSeeker login(String email, String password) {
		
		 try (Session session = sessionFactory.openSession()) {
	            Query<JobSeeker> query = session.createQuery("FROM JobSeeker WHERE email = :email", JobSeeker.class);
	            query.setParameter("email", email);
	            JobSeeker jobseeker = query.uniqueResult();
	            
	            if (jobseeker != null && jobseeker.getPassword().equals(password)) {
	                return jobseeker;
	            } else {
	                return null;
	            }
	        }
		 
	}
	
	@Override
	public boolean checkIfEmailExists(String email) {
		try (Session session = sessionFactory.openSession()) {
            Query<JobSeeker> query = session.createQuery("FROM JobSeeker WHERE email = :email", JobSeeker.class);
            query.setParameter("email", email);
            JobSeeker jobseeker = query.uniqueResult();
            
            if (jobseeker != null) {
                return true;
            } else {
                return false;
            }
        }
	}
	
	@Override
	public JobSeeker getJobSeekerById(int jobSeekerId) {
	    try (Session session = sessionFactory.openSession()) {
	        JobSeeker jobSeeker = session.get(JobSeeker.class, jobSeekerId);
	        return jobSeeker;
	    }
	}
	
	@Override
	public void updateJobSeeker(JobSeeker jobSeeker) {
		 hibernateTemplate.update(jobSeeker);
	 }

}
