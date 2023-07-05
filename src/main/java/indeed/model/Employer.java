package indeed.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@Entity
@Table(name = "employers")
public class Employer {

    public Employer(int employerId, String email, String password, String name, String phoneNumber,
			String numberOfEmployees, String companyName) {
		super();
		this.employerId = employerId;
		this.email = email;
		this.password = password;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.numberOfEmployees = numberOfEmployees;
		this.companyName = companyName;
	}
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int employerId;

	@Column(nullable = false)
    private String email;
	
	@Column(nullable = false)
    private String password;
	
	@Column(nullable = false)
    private String name;
	
	@Column(nullable = false)
    private String phoneNumber;
	
	@Column(nullable = false)
    private String numberOfEmployees;
	
	@Column(nullable = false)
    private String companyName;
	
	public int getEmployerId() {
		return employerId;
	}
	public void setEmployerId(int employerId) {
		this.employerId = employerId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getNumberOfEmployees() {
		return numberOfEmployees;
	}
	public void setNumberOfEmployees(String numberOfEmployees) {
		this.numberOfEmployees = numberOfEmployees;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	@Override
	public String toString() {
		return "Employer [employerId=" + employerId + ", email=" + email + ", password=" + password + ", name=" + name
				+ ", phoneNumber=" + phoneNumber + ", numberOfEmployees=" + numberOfEmployees + ", companyName="
				+ companyName + "]";
	}
	public Employer() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    

    
}
