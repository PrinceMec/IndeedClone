package indeed.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class WorkExperience {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int workExperienceId;
	
	@Column(nullable = false)
	private String jobTitle;
	
	@Column(nullable = false)
	private String companyName;
	
	@Column(nullable = false)
	private String country;
	
	@Column(nullable = false)
	private String city;
	
	@Column(nullable = false)
	private String province;
	
	@Column(nullable = false)
	private Date startDate;
	
	@Column(nullable = false)
	private Date endDate;
	
	@Column(nullable = false)
	private String description;
	
	public WorkExperience() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WorkExperience(String jobTitle, String companyName, String country, String city, String province,
			Date startDate, Date endDate, String description) {
		super();
		this.jobTitle = jobTitle;
		this.companyName = companyName;
		this.country = country;
		this.city = city;
		this.province = province;
		this.startDate = startDate;
		this.endDate = endDate;
		this.description = description;
	}
	@Override
	public String toString() {
		return "WorkExperience [jobTitle=" + jobTitle + ", companyName=" + companyName + ", country=" + country
				+ ", city=" + city + ", province=" + province + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", description=" + description + "]";
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
