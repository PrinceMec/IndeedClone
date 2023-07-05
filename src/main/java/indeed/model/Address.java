package indeed.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Address {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int addressId;
	
	@Column(nullable = false)
	private String streetAddress;
	
	@Column(nullable = false)
	private String city;
	
	@Column(nullable = false)
	private String province;
	
	@Column(nullable = false)
	private String PostalCode;
	
	@Column(nullable = false)
	private String country;
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Address() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Address(String streetAddress, String city, String province, String postalCode, String country) {
		super();
		this.streetAddress = streetAddress;
		this.city = city;
		this.province = province;
		this.country = country;
		PostalCode = postalCode;
	}
	@Override
	public String toString() {
		return "Address [streetAddress=" + streetAddress + ", city=" + city + ", province=" + province + ", PostalCode="
				+ PostalCode + "]";
	}
	public String getStreetAddress() {
		return streetAddress;
	}
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
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
	public String getPostalCode() {
		return PostalCode;
	}
	public void setPostalCode(String postalCode) {
		PostalCode = postalCode;
	}
}
