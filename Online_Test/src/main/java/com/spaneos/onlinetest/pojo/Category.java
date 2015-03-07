package com.spaneos.onlinetest.pojo;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity(name = "CATEGORY")
public class Category implements Serializable {

	@Id
	@GeneratedValue
	@Column(name = "CID")
	private long cId;
	@Column(name = "CNAME")
	private String cName;
	@Column(name = "CDESCRIPTION")
	private String cDescription;
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(mappedBy = "category")
	private List<TestSection> listSection;

	public Category() {

	}

	public Category(long cId, String cName, String cDescription,
			List<TestSection> listSection) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cDescription = cDescription;
		this.listSection = listSection;
	}

	public long getcId() {
		return cId;
	}

	public void setcId(long cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcDescription() {
		return cDescription;
	}

	public void setcDescription(String cDescription) {
		this.cDescription = cDescription;
	}

	public List<TestSection> getListSection() {
		return listSection;
	}

	public void setListSection(List<TestSection> listSection) {
		this.listSection = listSection;
	}

	

}
