package com.spaneos.onlinetest.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity(name = "NORMALFEEDBACK")
public class NormalFeedBack implements Serializable {

	@Id
	@GeneratedValue
	@Column(name="FID")
	private Long fId;
	@Column(name = "QID")
	private long qId;
	@Column(name = "ANSWERGIVEN")
	private String answerGiven;
	@Column(name = "ANSWERCORRECT")
	private String answerCorrect;
	@Column(name = "RESULT")
	private String result;
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "TEST_ID", nullable = true)
	private NormalTest normalTest;
	
	public NormalFeedBack() {
	
	}

	public NormalFeedBack(Long fId, long qId, String answerGiven,
			String answerCorrect, String result, NormalTest normalTest) {
		super();
		this.fId = fId;
		this.qId = qId;
		this.answerGiven = answerGiven;
		this.answerCorrect = answerCorrect;
		this.result = result;
		this.normalTest = normalTest;
	}

	public Long getfId() {
		return fId;
	}

	public void setfId(Long fId) {
		this.fId = fId;
	}

	public long getqId() {
		return qId;
	}

	public void setqId(long qId) {
		this.qId = qId;
	}

	public String getAnswerGiven() {
		return answerGiven;
	}

	public void setAnswerGiven(String answerGiven) {
		this.answerGiven = answerGiven;
	}

	public String getAnswerCorrect() {
		return answerCorrect;
	}

	public void setAnswerCorrect(String answerCorrect) {
		this.answerCorrect = answerCorrect;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public NormalTest getNormalTest() {
		return normalTest;
	}

	public void setNormalTest(NormalTest normalTest) {
		this.normalTest = normalTest;
	}

	
	
}
