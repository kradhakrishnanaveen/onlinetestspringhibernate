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

@Entity(name = "USER")
public class User implements Serializable{

	@Id
	@GeneratedValue
	@Column(name = "UID")
	private long uId;
	@Column(name = "UNAME")
	private String uName;
	@Column(name = "EMAIL")
	private String email;
	@Column(name = "MOBILE")
	private String mobile;
	@Column(name = "PASSWORD")
	private String password;
	@Column(name = "QUESTION")
	private String question;
	@Column(name = "ANSWER")
	private String answer;
	@Column(name = "MOCKSTATUS")
	private Integer mockstatus;
	@OneToMany(mappedBy = "user")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<NormalTest> listNormalTest;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(long uId, String uName, String email, String mobile,
			String password, String question, String answer,
			Integer mockstatus, List<NormalTest> listNormalTest) {
		super();
		this.uId = uId;
		this.uName = uName;
		this.email = email;
		this.mobile = mobile;
		this.password = password;
		this.question = question;
		this.answer = answer;
		this.mockstatus = mockstatus;
		this.listNormalTest = listNormalTest;
	}
	public long getuId() {
		return uId;
	}
	public void setuId(long uId) {
		this.uId = uId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Integer getMockstatus() {
		return mockstatus;
	}
	public void setMockstatus(Integer mockstatus) {
		this.mockstatus = mockstatus;
	}
	public List<NormalTest> getListNormalTest() {
		return listNormalTest;
	}
	public void setListNormalTest(List<NormalTest> listNormalTest) {
		this.listNormalTest = listNormalTest;
	}
	

	/*
	 * @OneToMany(fetch=FetchType.LAZY,mappedBy="user") private List<MockTest>
	 * listMockTest;
	 */
	
}
