package indeed.dao;

import java.util.List;


import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.hibernate.transform.DistinctRootEntityResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import indeed.model.Address;
import indeed.model.Job;
import indeed.model.JobSeeker;

@Repository
public class JobDao implements JobDaoInterface {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	@Autowired
	private SessionFactory sessionFactory;

	public JobDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JobDao(HibernateTemplate hibernateTemplate) {
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
	public int saveJob(Job job) {
		Integer rowAffected = (Integer)this.hibernateTemplate.save(job);
		return rowAffected;
	}
	
	@Override
	public List<Job> getAllJobs() {
		
		return this.hibernateTemplate.loadAll(Job.class);
	}
	
	@Override
	public Job getJobById(int jobId) {
		Session session = sessionFactory.openSession();
		
		try {
		    // Retrieve the object by ID
		    Job object = session.get(Job.class, jobId);

		    if (object != null) {
		        return object;
		    } else {
		        return null;
		    }
		} finally {
		    // Close the session
		    session.close();
		}
	}
	
	@Override
	public List<Job> getJobByEmployerId(int employerId) {
		Session session = sessionFactory.openSession();
		String queryString = "FROM Job j WHERE j.employer.employerId = :employerId";

		List<Job> jobList = session.createQuery(queryString, Job.class)
		                          .setParameter("employerId", employerId)
		                          .getResultList();
		return jobList;
	}
	
	@Override
	public List<Job> searchByTitleAndCity(String title, String city) {
        try (Session session = sessionFactory.openSession()) {
            Criteria criteria = session.createCriteria(Job.class);
            criteria.add(Restrictions.like("jobTitle", title + "%"));
            criteria.createAlias("address", "address");
            criteria.add(Restrictions.like("address.city", city + "%"));
            criteria.setResultTransformer(DistinctRootEntityResultTransformer.INSTANCE);

            List<Job> jobs = criteria.list();
            return jobs;
        }
    }
	
	@Override
	 public List<Job> searchByTitleAndEmployer(String title, int employerId) {
		 String queryString = "FROM Job j WHERE j.jobTitle LIKE :title AND j.employer.id = :employerId";
	     return (List<Job>) hibernateTemplate.findByNamedParam(queryString, new String[]{"title", "employerId"}, new Object[]{"%" + title + "%", employerId});
	 }
}
