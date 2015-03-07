package com.spaneos.onlinetest.dao;

import java.util.List;

import com.spaneos.onlinetest.pojo.Category;
import com.spaneos.onlinetest.pojo.NormalFeedBack;
import com.spaneos.onlinetest.pojo.NormalTest;
import com.spaneos.onlinetest.pojo.TestQuestions;
import com.spaneos.onlinetest.pojo.TestSection;
import com.spaneos.onlinetest.pojo.User;

public interface OnlineTestDao {

	public boolean addCategory(Category category);
	public boolean addTestSection(TestSection testSection, long categoryId);
	public boolean addTestQuestions(TestQuestions testQuestion, long sectionId);
	public Category getCategoryById(long categoryId);
	public List<Category> getAllCategories();
	public TestQuestions getQuestionById(long questionId);
	public List<TestQuestions> getAllQuestionsBySectionId(long sectionId);
	public TestSection getSectionById(long sectionId);
	public List<TestSection> getAllSectionsByCategoryId(long categoryId);
	public long addTestDetails(NormalTest normalTest, long uId);
	public NormalTest getTestDetails(long tId);
	public List<NormalFeedBack> getFeedBackTestDetails(long tId);
	public User getUserByEmail(String email);
	public User getUserById(long uId);
	public List<NormalTest> getTestDetailsByUserId(long uId);
	public User authenticateUser(String uname,String pwd);
}
