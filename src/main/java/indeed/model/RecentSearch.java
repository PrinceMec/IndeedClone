package indeed.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class RecentSearch {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int recentSearchId;
	
	@Column(nullable = false)
	private String jobTitle;
	
	@Column(nullable = false)
	private String city;
	
	@ManyToOne
    @JoinColumn(name = "jobSeekerId")
	private JobSeeker jobSeeker;

	public int getRecentSearchId() {
		return recentSearchId;
	}

	public void setRecentSearchId(int recentSearchId) {
		this.recentSearchId = recentSearchId;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public JobSeeker getJobSeeker() {
		return jobSeeker;
	}

	public void setJobSeeker(JobSeeker jobSeeker) {
		this.jobSeeker = jobSeeker;
	}
}
