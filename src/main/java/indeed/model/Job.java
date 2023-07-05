package indeed.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import java.util.Date;
import java.util.List;
import java.util.Set;

@Entity
public class Job {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int jobId;

    @Column(nullable = false)
    private String jobTitle;
    
    @Column(nullable = false)
    private String jobsLocation; // In-person/hybrid
    
    @Column(nullable = false)
    private String languageToPerformThisJob;
    
    @Column(nullable = false)
    private String languageTrainingProvided;

    @ElementCollection(fetch = FetchType.EAGER)
    @Column(nullable = false)
    private Set<String> jobType;

    @ElementCollection(fetch = FetchType.EAGER)
    @Column(nullable = false)
    private Set<String> jobSchedule;

    @Column(nullable = false)
    private String numberlimitForThisRole;
    
    @Column(nullable = false)
    private String howQuicklyDoYouNeedToHire;
    
    @Column(nullable = false)
    private float minimumPay;
    
    @Column(nullable = false)
    private float maximumPay;
    
    @ElementCollection(fetch = FetchType.EAGER)
    @Column(nullable = false)
    private Set<String> supplementalPay;
    
    @ElementCollection(fetch = FetchType.EAGER)
    @Column(nullable = false)
    private Set<String> benefitsOffered;
    
    
    
    @Column(columnDefinition = "varchar(10000)", nullable = false)
    private String jobDescription;
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    private Date applicationDeadline;
    
    @Temporal(TemporalType.DATE)
    @Column(nullable = false)
    private Date startDate;

    @ManyToOne
    @JoinColumn(name = "employerId")
    private Employer employer;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Address address;

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getLanguageTrainingProvided() {
		return languageTrainingProvided;
	}

	public int getJobId() {
		return jobId;
	}

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getJobsLocation() {
		return jobsLocation;
	}

	public void setJobsLocation(String jobsLocation) {
		this.jobsLocation = jobsLocation;
	}

	

	public String getLanguageToPerformThisJob() {
		return languageToPerformThisJob;
	}

	public void setLanguageToPerformThisJob(String languageToPerformThisJob) {
		this.languageToPerformThisJob = languageToPerformThisJob;
	}

	public String isLanguageTrainingProvided() {
		return languageTrainingProvided;
	}

	public void setLanguageTrainingProvided(String languageTrainingProvided) {
		this.languageTrainingProvided = languageTrainingProvided;
	}

	public Set<String> getJobType() {
		return jobType;
	}

	public void setJobType(Set<String> jobType) {
		this.jobType = jobType;
	}

	public Set<String> getJobSchedule() {
		return jobSchedule;
	}

	public void setJobSchedule(Set<String> jobSchedule) {
		this.jobSchedule = jobSchedule;
	}

	public String getNumberlimitForThisRole() {
		return numberlimitForThisRole;
	}

	public void setNumberlimitForThisRole(String numberlimitForThisRole) {
		this.numberlimitForThisRole = numberlimitForThisRole;
	}

	public String getHowQuicklyDoYouNeedToHire() {
		return howQuicklyDoYouNeedToHire;
	}

	public void setHowQuicklyDoYouNeedToHire(String howQuicklyDoYouNeedToHire) {
		this.howQuicklyDoYouNeedToHire = howQuicklyDoYouNeedToHire;
	}

	public float getMinimumPay() {
		return minimumPay;
	}

	public void setMinimumPay(float minimumPay) {
		this.minimumPay = minimumPay;
	}

	public float getMaximumPay() {
		return maximumPay;
	}

	public void setMaximumPay(float maximumPay) {
		this.maximumPay = maximumPay;
	}

	public Set<String> getSupplementalPay() {
		return supplementalPay;
	}

	public void setSupplementalPay(Set<String> supplementalPay) {
		this.supplementalPay = supplementalPay;
	}

	public Set<String> getBenefitsOffered() {
		return benefitsOffered;
	}

	public void setBenefitsOffered(Set<String> benefitsOffered) {
		this.benefitsOffered = benefitsOffered;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public Date getApplicationDeadline() {
		return applicationDeadline;
	}

	public void setApplicationDeadline(Date applicationDeadline) {
		this.applicationDeadline = applicationDeadline;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
	}

	@Override
	public String toString() {
		return "Job [jobId=" + jobId + ", jobTitle=" + jobTitle + ", jobsLocation=" + jobsLocation
				+  ", languageToPerformThisJob="
				+ languageToPerformThisJob + ", isLanguageTrainingProvided=" + languageTrainingProvided + ", jobType="
				+ jobType + ", jobSchedule=" + jobSchedule + ", numberlimitForThisRole=" + numberlimitForThisRole
				+ ", howQuicklyDoYouNeedToHire=" + howQuicklyDoYouNeedToHire + ", minimumPay=" + minimumPay
				+ ", maximumPay=" + maximumPay + ", supplementalPay=" + supplementalPay + ", benefitsOffered="
				+ benefitsOffered + ", jobDescription=" + jobDescription + ", applicationDeadline="
				+ applicationDeadline + ", startDate=" + startDate + ", employer=" + employer + "]";
	}

	public Job(int jobId, String jobTitle, String jobsLocation, 
			String languageToPerformThisJob, String languageTrainingProvided, Set<String> jobType,
			Set<String> jobSchedule, String numberlimitForThisRole, String howQuicklyDoYouNeedToHire, float minimumPay,
			float maximumPay, Set<String> supplementalPay, Set<String> benefitsOffered, String jobDescription,
			Date applicationDeadline, Date startDate, Employer employer) {
		super();
		this.jobId = jobId;
		this.jobTitle = jobTitle;
		this.jobsLocation = jobsLocation;
		
		this.languageToPerformThisJob = languageToPerformThisJob;
		this.languageTrainingProvided = languageTrainingProvided;
		this.jobType = jobType;
		this.jobSchedule = jobSchedule;
		this.numberlimitForThisRole = numberlimitForThisRole;
		this.howQuicklyDoYouNeedToHire = howQuicklyDoYouNeedToHire;
		this.minimumPay = minimumPay;
		this.maximumPay = maximumPay;
		this.supplementalPay = supplementalPay;
		this.benefitsOffered = benefitsOffered;
		this.jobDescription = jobDescription;
		this.applicationDeadline = applicationDeadline;
		this.startDate = startDate;
		this.employer = employer;
	}

	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}

    // Constructors, getters, and setters

    
}
