package indeed.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

import java.util.Arrays;
import java.util.Date;

@Entity
public class JobApplication {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int jobApplicationId;

    

    @Lob
    private byte[] resumePDf;
    private String status;
    private Date applicationSubmitDate;

    @ManyToOne
    @JoinColumn(name = "jobId")
    private Job job;

    @ManyToOne
    @JoinColumn(name = "employerId")
    private Employer employer;

    @ManyToOne
    @JoinColumn(name = "jobSeekerId")
    private JobSeeker jobSeeker;

	public int getJobApplicationId() {
		return jobApplicationId;
	}

	public void setJobApplicationId(int jobApplicationId) {
		this.jobApplicationId = jobApplicationId;
	}

	public byte[] getResumePDf() {
		return resumePDf;
	}

	public void setResumePDf(byte[] resumePDf) {
		this.resumePDf = resumePDf;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getApplicationSubmitDate() {
		return applicationSubmitDate;
	}

	public void setApplicationSubmitDate(Date applicationSubmitDate) {
		this.applicationSubmitDate = applicationSubmitDate;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
	}

	public JobSeeker getJobSeeker() {
		return jobSeeker;
	}

	public void setJobSeeker(JobSeeker jobSeeker) {
		this.jobSeeker = jobSeeker;
	}

	@Override
	public String toString() {
		return "JobApplication [jobApplicationId=" + jobApplicationId + ", resumePDf=" + Arrays.toString(resumePDf)
				+ ", status=" + status + ", applicationSubmitDate=" + applicationSubmitDate + ", job=" + job
				+ ", employer=" + employer + ", jobSeeker=" + jobSeeker + "]";
	}

	public JobApplication(int jobApplicationId, byte[] resumePDf, String status, Date applicationSubmitDate, Job job,
			Employer employer, JobSeeker jobSeeker) {
		super();
		this.jobApplicationId = jobApplicationId;
		this.resumePDf = resumePDf;
		this.status = status;
		this.applicationSubmitDate = applicationSubmitDate;
		this.job = job;
		this.employer = employer;
		this.jobSeeker = jobSeeker;
	}

	public JobApplication() {
		super();
		// TODO Auto-generated constructor stub
	}

    
    
}
