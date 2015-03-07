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

@Entity(name = "TESTQUESTIONS")
public class TestQuestions implements Serializable{

	@Id
	@GeneratedValue
	@Column(name = "QID")
	private long qId;
	@Column(name = "QUESTION")
	private String question;
	@Column(name = "OPT1")
	private String opt1;
	@Column(name = "OPT2")
	private String opt2;
	@Column(name = "OPT3")
	private String opt3;
	@Column(name = "OPT4")
	private String opt4;
	@Column(name = "OPT5")
	private String opt5;
	@Column(name = "ANSWER")
	private String answer;
	@Column(name = "EXPLANATION")
	private String explanation;
	@ManyToOne
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinColumn(name = "SECTION_ID", nullable = true)
	private TestSection testSection;

	public TestQuestions() {

	}

	public TestQuestions(long qId, String question, String opt1, String opt2,
			String opt3, String opt4, String opt5, String answer,
			String explanation, TestSection testSection) {
		super();
		this.qId = qId;
		this.question = question;
		this.opt1 = opt1;
		this.opt2 = opt2;
		this.opt3 = opt3;
		this.opt4 = opt4;
		this.opt5 = opt5;
		this.answer = answer;
		this.explanation = explanation;
		this.testSection = testSection;
	}

	public long getqId() {
		return qId;
	}

	public void setqId(long qId) {
		this.qId = qId;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOpt1() {
		return opt1;
	}

	public void setOpt1(String opt1) {
		this.opt1 = opt1;
	}

	public String getOpt2() {
		return opt2;
	}

	public void setOpt2(String opt2) {
		this.opt2 = opt2;
	}

	public String getOpt3() {
		return opt3;
	}

	public void setOpt3(String opt3) {
		this.opt3 = opt3;
	}

	public String getOpt4() {
		return opt4;
	}

	public void setOpt4(String opt4) {
		this.opt4 = opt4;
	}

	public String getOpt5() {
		return opt5;
	}

	public void setOpt5(String opt5) {
		this.opt5 = opt5;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}

	public TestSection getTestSection() {
		return testSection;
	}

	public void setTestSection(TestSection testSection) {
		this.testSection = testSection;
	}

}
