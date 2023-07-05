package indeed.dao;

import indeed.model.Employer;

public interface EmployerDaoInterface {
	
	public int saveEmployer(Employer employer);
	
	public boolean login(String email, String password);
	
	public Employer getEmployerByEmail(String email);
	
	public Employer getEmployerById(int employerId);
	
	public void updateEmployer(Employer employer);
	
	public boolean checkIfEmailExists(String email);
}
