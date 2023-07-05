package indeed.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import indeed.model.Job;
import indeed.model.RecentSearch;

@Repository
public class RecentSearchDao implements RecentSearchDaoInterface {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public void saveSearch(RecentSearch recentSearch) {
		this.hibernateTemplate.save(recentSearch);
	}

	@Override
	public List<RecentSearch> getAllSearches(int jobSeekerId) {
		Session session = sessionFactory.openSession();
		String queryString = "FROM RecentSearch rs WHERE rs.jobSeeker.id = :jobSeekerId";



		List<RecentSearch> recentSearches = session.createQuery(queryString, RecentSearch.class)
		                          .setParameter("jobSeekerId", jobSeekerId)
		                          .getResultList();
		return recentSearches;
	}
	
	
}
