package indeed.dao;

import org.hibernate.Session;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import indeed.model.Employer;
import indeed.model.Job;
import indeed.model.JobSeeker;

@Repository
public class EmployerDao implements EmployerDaoInterface{
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory sessionFactory;
	

	
	public EmployerDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmployerDao(HibernateTemplate hibernateTemplate) {
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
	public int saveEmployer(Employer employer) {
		Integer rowAffected = (Integer)this.hibernateTemplate.save(employer);
		
		return rowAffected;
	}
	
	public boolean login(String email, String password) {
		
		 try (Session session = sessionFactory.openSession()) {
	            Query<Employer> query = session.createQuery("FROM Employer WHERE email = :email", Employer.class);
	            query.setParameter("email", email);
	            Employer employer = query.uniqueResult();
	            
	            if (employer != null && employer.getPassword().equals(password)) {
	                return true;
	            } else {
	                return false;
	            }
	        }
		 
	}
	
	@Override
	public Employer getEmployerByEmail(String email) {
		
		try (Session session = sessionFactory.openSession()) {
            Query<Employer> query = session.createQuery("FROM Employer WHERE email = :email", Employer.class);
            query.setParameter("email", email);
            Employer employer = query.uniqueResult();
            
            if (employer != null) {
                return employer;
            } else {
                return null;
            }
        }
	}
	
	@Override
	public boolean checkIfEmailExists(String email) {
		Employer employer = this.getEmployerByEmail(email);
		
		if(employer == null)
			return false;
		
		return true;
	}
	
	@Override
	public Employer getEmployerById(int employerId) {
		Session session = sessionFactory.openSession();
		
		try {
		    // Retrieve the object by ID
		    Employer object = session.get(Employer.class, employerId);

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
	public void updateEmployer(Employer employer) {
		Session session = sessionFactory.getCurrentSession();

	    try {
	        // Retrieve the object to update
	        Employer objectToUpdate = session.get(Employer.class, employer.getEmployerId());
	        //System.out.println("In DAO: " + objectToUpdate);
	        // Make changes to the object

	        objectToUpdate.setCompanyName(employer.getCompanyName());
	        objectToUpdate.setEmail(employer.getEmail());
	        objectToUpdate.setName(employer.getName());
	        objectToUpdate.setNumberOfEmployees(employer.getNumberOfEmployees());
	        objectToUpdate.setPhoneNumber(employer.getPhoneNumber());
	        objectToUpdate.setPassword(employer.getPassword());

	        // The object is automatically updated within the session
	    } catch (Exception e) {
	        // Handle exceptions
	        throw e; // Rethrow the exception to trigger rollback
	    }
	}

	
	
}
