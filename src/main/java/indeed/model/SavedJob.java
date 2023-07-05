package indeed.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class SavedJob {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int savedJobId;
	
	@OneToOne
    @JoinColumn(name = "jobId")
	private Job job;
	
	@ManyToOne
    @JoinColumn(name = "jobSeekerId")
	private JobSeeker jobSeeker;
	
	public int getSavedJobId() {
		return savedJobId;
	}

	public void setSavedJobId(int savedJobId) {
		this.savedJobId = savedJobId;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public JobSeeker getJobSeeker() {
		return jobSeeker;
	}

	public void setJobSeeker(JobSeeker jobSeeker) {
		this.jobSeeker = jobSeeker;
	}

	
}
