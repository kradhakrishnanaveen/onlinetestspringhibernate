package com.spaneos.onlinetest.service;

import java.util.List;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spaneos.onlinetest.dao.OnlineTestDao;
import com.spaneos.onlinetest.dao.OnlineTestDaoImp;
import com.spaneos.onlinetest.pojo.Category;
import com.spaneos.onlinetest.pojo.NormalFeedBack;
import com.spaneos.onlinetest.pojo.NormalTest;
import com.spaneos.onlinetest.pojo.TestQuestions;
import com.spaneos.onlinetest.pojo.TestSection;
import com.spaneos.onlinetest.pojo.User;
@Service
public class OnlineTestServiceImp implements OnlineTestService {

	@Autowired
	OnlineTestDao onlineTestDaoImp;
	
	public OnlineTestDao getOnlineTestDaoImp() {
		return onlineTestDaoImp;
	}

	public void setOnlineTestDaoImp(OnlineTestDao onlineTestDaoImp) {
		this.onlineTestDaoImp = onlineTestDaoImp;
	}

	@Override
	public boolean addCategory(Category category) {
		return onlineTestDaoImp.addCategory(category);
	}

	@Override
	public boolean addTestSection(TestSection testSection, long categoryId) {
		return onlineTestDaoImp.addTestSection(testSection, categoryId);
	}

	@Override
	public boolean addTestQuestions(TestQuestions testQuestion, long sectionId) {
		return onlineTestDaoImp.addTestQuestions(testQuestion, sectionId);
	}

	@Override
	public Category getCategoryById(long categoryId) {
		Category category = onlineTestDaoImp.getCategoryById(categoryId);
		category.setListSection(getAllSectionsByCategoryId(category.getcId()));
		return category;
	}

	@Override
	public List<Category> getAllCategories() {
		List<Category> listCategories = onlineTestDaoImp.getAllCategories();
		
		for(Category category:listCategories){
			category.setListSection(getAllSectionsByCategoryId(category.getcId()));
		}
		
		return listCategories;
	}

	@Override
	public TestQuestions getQuestionById(long questionId) {
		return onlineTestDaoImp.getQuestionById(questionId);
	}

	@Override
	public List<TestQuestions> getAllQuestionsBySectionId(long sectionId) {
		return onlineTestDaoImp.getAllQuestionsBySectionId(sectionId);
	}

	@Override
	public TestSection getSectionById(long sectionId) {
		
		TestSection testSection = onlineTestDaoImp.getSectionById(sectionId);
		testSection.setListQuestions(getAllQuestionsBySectionId(testSection.getsId()));
		
		return testSection;
		
	}

	@Override
	public List<TestSection> getAllSectionsByCategoryId(long categoryId) {
		List<TestSection> listTestSections = onlineTestDaoImp.getAllSectionsByCategoryId(categoryId);
		for(TestSection testSection : listTestSections){
			testSection.setListQuestions(getAllQuestionsBySectionId(testSection.getsId()));
			
		}
		return listTestSections;
	}

	@Override
	public long addTestDetails(NormalTest normalTest, long uId) {
		
		return onlineTestDaoImp.addTestDetails(normalTest,uId);
	}

	@Override
	public NormalTest getTestDetails(long tId) {
		NormalTest normalTest = onlineTestDaoImp.getTestDetails(tId);
		normalTest.setListNormalFeedBack(getFeedBackTestDetails(tId));
		normalTest.setTestSection(getSectionById(normalTest.getTestSection().getsId()));
		return normalTest;
	}

	@Override
	public List<NormalFeedBack> getFeedBackTestDetails(long tId) {
		return onlineTestDaoImp.getFeedBackTestDetails(tId);
	}

	@Override
	public User getUserByEmail(String email) {
		User user = onlineTestDaoImp.getUserByEmail(email);
		user.setListNormalTest(getTestDetailsByUserId(user.getuId()));
		return user;
	}

	@Override
	public User getUserById(long uId) {
		User user = onlineTestDaoImp.getUserById(uId);
		user.setListNormalTest(getTestDetailsByUserId(uId));
		return user;
	}

	@Override
	public List<NormalTest> getTestDetailsByUserId(long uId) {
		List<NormalTest> list = onlineTestDaoImp.getTestDetailsByUserId(uId);
		/*for(NormalTest normalTest:list){
			normalTest.setListNormalFeedBack(getFeedBackTestDetails(normalTest.gettId()));
			normalTest.setTestSection(getSectionById(normalTest.getTestSection().getsId()));
		}*/
		return list;
	}

	@Override
	public User authenticateUser(String uname, String pwd) {
		
		return onlineTestDaoImp.authenticateUser(uname, pwd);
	}	
}
