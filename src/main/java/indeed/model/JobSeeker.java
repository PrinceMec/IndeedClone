package indeed.model;

import java.util.List;
import java.util.Set;

import javax.annotation.Generated;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
public class JobSeeker {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int jobSeekerId;
	
	@Column(nullable = false)
	private String email;
	
	@Column(nullable = false)
	private String password;
	
	@Column(nullable = false)
	private String firstName;
	
	@Column(nullable = false)
	private String lastname;
	
	@Column(nullable = false)
	private long phoneNumber;
	
	@OneToOne(cascade = CascadeType.ALL)
	private Address address;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<Education> educations;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private Set<WorkExperience> workexperience;
	
	@ElementCollection(fetch = FetchType.EAGER)
	@Column(nullable = false)
	private Set<String> skills;
	
	@ElementCollection(fetch = FetchType.EAGER)
	@Column(nullable = false)
	private Set<String> certifications;
	
	@Column(nullable = false)
	private float minimumBasePay;
	
	@Column(nullable = false)
	private String desiredJobTitle;
	
	@Column(nullable = false)
	private String willingToRelocate;
	
	@ElementCollection(fetch = FetchType.EAGER)
	@Column(nullable = false)
	private Set<String> desiredJobTypes;
	
	@ElementCollection(fetch = FetchType.EAGER)
	@Column(nullable = false)
	private Set<String> desiredWorkSchedule;

	public JobSeeker() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JobSeeker(int jobSeekerId, String email, String password, String firstName, String lastname,
			long phoneNumber, Address address, Set<Education> educations, Set<WorkExperience> workexperiences,
			Set<String> skills, Set<String> certifications, float minimumBasePay,
			String desiredJobTitle, String willingToRelocate, Set<String> desiredJobTypes,
			Set<String> desiredWorkSchedule) {
		super();
		this.jobSeekerId = jobSeekerId;
		this.email = email;
		this.password = password;
		this.firstName = firstName;
		this.lastname = lastname;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.educations = educations;
		this.workexperience = workexperiences;
		this.skills = skills;
		this.certifications = certifications;
		this.minimumBasePay = minimumBasePay;
		
		this.desiredJobTitle = desiredJobTitle;
		this.willingToRelocate = willingToRelocate;
		this.desiredJobTypes = desiredJobTypes;
		this.desiredWorkSchedule = desiredWorkSchedule;
	}

	@Override
	public String toString() {
		return "JobSeeker [jobSeekerId=" + jobSeekerId + ", email=" + email + ", password=" + password
				+ ", firstName=" + firstName + ", lastname=" + lastname + ", phoneNumber=" + phoneNumber + ", address="
				+ address + ", educations=" + educations + ", workexperiences=" + workexperience + ", skills=" + skills
				+ ", certifications=" + certifications + ", minimumBasePay=" + minimumBasePay + ", desiredJobTitle=" + desiredJobTitle + ", willingToRelocate=" + willingToRelocate
				+ ", desiredJobTypes=" + desiredJobTypes + ", desiredWorkSchedule=" + desiredWorkSchedule + "]";
	}

	public int getJobSeekerId() {
		return jobSeekerId;
	}

	public void setJobSeekerId(int jobSeekerId) {
		this.jobSeekerId = jobSeekerId;
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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Set<Education> getEducations() {
		return educations;
	}

	public void setEducations(Set<Education> educations) {
		this.educations = educations;
	}

	public Set<WorkExperience> getWorkexperience() {
		return workexperience;
	}

	public void setWorkexperience(Set<WorkExperience> workexperience) {
		this.workexperience = workexperience;
	}

	public Set<String> getSkills() {
		return skills;
	}

	public void setSkills(Set<String> skills) {
		this.skills = skills;
	}

	public Set<String> getCertifications() {
		return certifications;
	}

	public void setCertifications(Set<String> certifications) {
		this.certifications = certifications;
	}

	public float getMinimumBasePay() {
		return minimumBasePay;
	}

	public void setMinimumBasePay(float minimumBasePay) {
		this.minimumBasePay = minimumBasePay;
	}

	

	public String getDesiredJobTitle() {
		return desiredJobTitle;
	}

	public void setDesiredJobTitle(String desiredJobTitle) {
		this.desiredJobTitle = desiredJobTitle;
	}

	public String getWillingToRelocate() {
		return willingToRelocate;
	}

	public void setWillingToRelocate(String willingToRelocate) {
		this.willingToRelocate = willingToRelocate;
	}

	public Set<String> getDesiredJobTypes() {
		return desiredJobTypes;
	}

	public void setDesiredJobTypes(Set<String> desiredJobTypes) {
		this.desiredJobTypes = desiredJobTypes;
	}

	public Set<String> getDesiredWorkSchedule() {
		return desiredWorkSchedule;
	}

	public void setDesiredWorkSchedule(Set<String> desiredWorkSchedule) {
		this.desiredWorkSchedule = desiredWorkSchedule;
	}
	
	
}
