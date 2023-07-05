package indeed.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import indeed.dao.EmployerDao;
import indeed.dao.JobSeekerDao;
import indeed.model.Employer;
import indeed.model.JobSeeker;

@Service
public class EmployerService {
	
	@Autowired
	private EmployerDao employerDao;
	
	@Transactional
	public int createEmployer(Employer employer) {
		return this.employerDao.saveEmployer(employer);
	}
	
	public boolean login(String email, String password) {
		return employerDao.login(email, password);
	}
	
	public Employer getEmployerByEmail(String email) {
		return this.employerDao.getEmployerByEmail(email);
	}
	
	public Employer getEmployerById(int employerId) {
		return this.employerDao.getEmployerById(employerId);
	}
	
	@Transactional
	public void updateEmployer(Employer employer) {
		this.employerDao.updateEmployer(employer);
	}
	
	public boolean checkIfEmailExists(String email) {
		return this.employerDao.checkIfEmailExists(email);
	}
}
