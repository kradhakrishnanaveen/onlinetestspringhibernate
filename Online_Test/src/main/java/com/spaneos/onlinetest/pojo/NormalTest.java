package com.spaneos.onlinetest.pojo;

import java.io.Serializable;
import java.util.Date;
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

@Entity(name = "NORMALTEST")
public class NormalTest implements Serializable{

	@Id
	@GeneratedValue
	@Column(name = "TID")
	private long tId;
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "SECTION_ID", nullable = true)
	private TestSection testSection;
	@Column(name = "TMARKS")
	private int tMarks;
	@Column(name = "TDATE")
	private Date tDate;
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "USER_ID", nullable = true)
	private User user;
	@OneToMany(mappedBy = "normalTest")
	@LazyCollection(LazyCollectionOption.FALSE)
	List<NormalFeedBack> listNormalFeedBack;
	
	public NormalTest() {
	
	}

	public NormalTest(long tId, TestSection testSection, int tMarks,
			Date tDate, User user, List<NormalFeedBack> listNormalFeedBack) {
		super();
		this.tId = tId;
		this.testSection = testSection;
		this.tMarks = tMarks;
		this.tDate = tDate;
		this.user = user;
		this.listNormalFeedBack = listNormalFeedBack;
	}

	public long gettId() {
		return tId;
	}

	public void settId(long tId) {
		this.tId = tId;
	}

	public TestSection getTestSection() {
		return testSection;
	}

	public void setTestSection(TestSection testSection) {
		this.testSection = testSection;
	}

	public int gettMarks() {
		return tMarks;
	}

	public void settMarks(int tMarks) {
		this.tMarks = tMarks;
	}

	public Date gettDate() {
		return tDate;
	}

	public void settDate(Date tDate) {
		this.tDate = tDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<NormalFeedBack> getListNormalFeedBack() {
		return listNormalFeedBack;
	}

	public void setListNormalFeedBack(List<NormalFeedBack> listNormalFeedBack) {
		this.listNormalFeedBack = listNormalFeedBack;
	}

	
}
