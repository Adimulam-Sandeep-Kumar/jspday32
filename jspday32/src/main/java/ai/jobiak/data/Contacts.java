package ai.jobiak.data;

import java.io.Serializable;

public class Contacts implements Serializable {
	
	private String contactId;
	private String name;
	private String mobilenum;
	
	public Contacts() {
		// TODO Auto-generated constructor stub
	}

	public Contacts(String contactId, String name, String mobilenum) {
		this.contactId = contactId;
		this.name = name;
		this.mobilenum = mobilenum;
	}

	public String getContactId() {
		return contactId;
	}

	public void setContactId(String contactId) {
		this.contactId = contactId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobilenum() {
		return mobilenum;
	}

	public void setMobilenum(String mobilenum) {
		this.mobilenum = mobilenum;
	}

	@Override
	public String toString() {
		return "contacts [contactId=" + contactId + ", name=" + name + ", mobilenum=" + mobilenum + "]";
	}
	
}
