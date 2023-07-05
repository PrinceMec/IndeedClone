package indeed.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Education {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int educationId;
	
	@Column(nullable = false)
	private String levelOfEducation;
	
	@Column(nullable = false)
	private String fieldOfStudy;
	
	@Column(nullable = false)
	private String schoolName;
	
	@Column(nullable = false)
	private String country;
	
	@Column(nullable = false)
	private String city;
	
	@Column(nullable = false)
	private String province;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Date startDate;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Date endDate;
	
	public Education() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Education(String levelOfEducation, String fieldOfStudy, String schoolName, String country, String city,
			String province, Date startDate, Date endDate) {
		super();
		this.levelOfEducation = levelOfEducation;
		this.fieldOfStudy = fieldOfStudy;
		this.schoolName = schoolName;
		this.country = country;
		this.city = city;
		this.province = province;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "Education [levelOfEducation=" + levelOfEducation + ", fieldOfStudy=" + fieldOfStudy + ", schoolName="
				+ schoolName + ", country=" + country + ", city=" + city + ", province=" + province + ", startDate="
				+ startDate + ", endDate=" + endDate + "]";
	}
	public String getLevelOfEducation() {
		return levelOfEducation;
	}
	public void setLevelOfEducation(String levelOfEducation) {
		this.levelOfEducation = levelOfEducation;
	}
	public String getFieldOfStudy() {
		return fieldOfStudy;
	}
	public void setFieldOfStudy(String fieldOfStudy) {
		this.fieldOfStudy = fieldOfStudy;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
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
	
}
