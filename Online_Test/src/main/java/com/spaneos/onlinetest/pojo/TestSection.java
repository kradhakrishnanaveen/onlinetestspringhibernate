package com.spaneos.onlinetest.pojo;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity(name = "TESTSECTION")
public class TestSection implements Serializable{

	@Id
	@GeneratedValue
	@Column(name = "SID")
	private long sId;
	@Column(name = "SNAME")
	private String sName;
	@Column(name = "SDESCRIPTION")
	private String sDescription;
	@Column(name = "STIME")
	private Integer sTime;
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "CATEGORY_ID", nullable = true)
	private Category category;
	@OneToMany(mappedBy = "testSection")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<TestQuestions> listQuestions;
	
	
	public TestSection(long sId, String sName, String sDescription,
			Integer sTime, Category category, List<TestQuestions> listQuestions) {
		super();
		this.sId = sId;
		this.sName = sName;
		this.sDescription = sDescription;
		this.sTime = sTime;
		this.category = category;
		this.listQuestions = listQuestions;
	}
	public TestSection() {
		super();
		// TODO Auto-generated constructor stub
	}
	public long getsId() {
		return sId;
	}
	public void setsId(long sId) {
		this.sId = sId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsDescription() {
		return sDescription;
	}
	public void setsDescription(String sDescription) {
		this.sDescription = sDescription;
	}
	public Integer getsTime() {
		return sTime;
	}
	public void setsTime(Integer sTime) {
		this.sTime = sTime;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public List<TestQuestions> getListQuestions() {
		return listQuestions;
	}
	public void setListQuestions(List<TestQuestions> listQuestions) {
		this.listQuestions = listQuestions;
	}
	

	
}
