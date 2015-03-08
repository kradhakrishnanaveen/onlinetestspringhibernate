package com.spaneos.onlinetest.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spaneos.onlinetest.pojo.Category;
import com.spaneos.onlinetest.pojo.NormalFeedBack;
import com.spaneos.onlinetest.pojo.NormalTest;
import com.spaneos.onlinetest.pojo.TestQuestions;
import com.spaneos.onlinetest.pojo.TestSection;
import com.spaneos.onlinetest.pojo.User;

@Repository
public class OnlineTestDaoImp implements OnlineTestDao {

	@Autowired
	private SessionFactory sessionFactory;

	public OnlineTestDaoImp() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OnlineTestDaoImp(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean addCategory(Category category) {

		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();

			session.saveOrUpdate(category);

			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
			return false;
		} finally {
			if (session != null)
				session.close();
		}

		return true;
	}

	@Override
	public boolean addTestSection(TestSection testSection, long categoryId) {

		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();

			testSection.setCategory(getCategoryById(categoryId));
			session.saveOrUpdate(testSection);

			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
			return false;
		} finally {
			if (session != null)
				session.close();
		}

		return true;
	}

	@Override
	public boolean addTestQuestions(TestQuestions testQuestion, long sectionId) {

		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();

			testQuestion.setTestSection(getSectionById(sectionId));
			session.saveOrUpdate(testQuestion);

			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
			return false;
		} finally {
			if (session != null)
				session.close();
		}

		return true;
	}

	@Override
	public Category getCategoryById(long categoryId) {

		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			Category category =  (Category) session.get(Category.class, categoryId);
			
			return category;
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return null;
	}

	@Override
	public List<Category> getAllCategories() {

		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			Criteria criteria = session.createCriteria(Category.class);
			return criteria.list();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return null;
	}

	@Override
	public TestQuestions getQuestionById(long questionId) {

		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			return (TestQuestions) session.get(TestQuestions.class, questionId);
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return null;
	}

	@Override
	public List<TestQuestions> getAllQuestionsBySectionId(long sectionId) {

		return getSectionById(sectionId).getListQuestions();
		/*Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			Criteria criteria = session.createCriteria(TestQuestions.class);
			criteria.add(Restrictions.eq("SECTION_ID", sectionId));					
			return criteria.list();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return null;*/
	}

	@Override
	public TestSection getSectionById(long sectionId) {
		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			return (TestSection) session.get(TestSection.class, sectionId);
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return null;
	}

	@Override
	public List<TestSection> getAllSectionsByCategoryId(long categoryId) {
		return getCategoryById(categoryId).getListSection();
	}

	@Override
	public long addTestDetails(NormalTest normalTest, long uId) {

		/*String date = new SimpleDateFormat("yyyy-MM-yy").format(new Date());
		Date date1 = null;
		try {
			date1 = new SimpleDateFormat("yyyy-MM-yy").parse(date);
		} catch (ParseException e1) {
			
			e1.printStackTrace();
		}
		normalTest.settDate(date1);*/
		normalTest.setUser(getUserById(uId));

		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();

			session.save(normalTest);
			NormalTest normalTest1 = (NormalTest) session.get(NormalTest.class, normalTest.gettId());
			for(NormalFeedBack no : normalTest.getListNormalFeedBack()){
				no.setNormalTest(normalTest1);
				session.save(no);
			}
				
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
			return -1;
		} finally {
			if (session != null)
				session.close();
		}

		return normalTest.gettId();

	}

	@Override
	public NormalTest getTestDetails(long tId) {

		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			return (NormalTest) session.get(NormalTest.class, tId);
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return null;
	}

	@Override
	public List<NormalFeedBack> getFeedBackTestDetails(long tId) {
		return getTestDetails(tId).getListNormalFeedBack();
	}

	@Override
	public User getUserByEmail(String email) {
		
		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			Criteria criteria = session.createCriteria(User.class);
			criteria.add(Restrictions.like("email", email));
			User user = (User) criteria.uniqueResult();
			return user;
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return null;
	}

	@Override
	public User getUserById(long uId) {
		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			return (User) session.get(User.class, uId);
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return null;
	}

	@Override
	public List<NormalTest> getTestDetailsByUserId(long uId) {
		return getUserById(uId).getListNormalTest();
	}

	@Override
	public User authenticateUser(String email, String pwd) {

		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			User user = null;
			try {
				/*
				 * query =
				 * session.createQuery("from User where email like :email");
				 * query.setString("email", email); System.out.println(query);
				 * Object obj= query.uniqueResult(); user = (User)obj;
				 */
				Criteria criteria = session.createCriteria(User.class);
				criteria.add(Restrictions.and(
						Restrictions.like("email", email),
						Restrictions.like("password", pwd)));
			

				user = (User) criteria.uniqueResult();
			} catch (Exception e) {
				System.out.println("catch block");
				e.printStackTrace();
			}
			/*
			 * Criteria criteria = session.createCriteria(User.class);
			 * criteria.add(Restrictions.like("email", email)); List<User> users
			 * = criteria.list(); System.out.println("user is:"+users);
			 */
			/*
			 * User ss = (User) session.get(User.class, 2);
			 * System.out.println(ss); return ss;
			 */
			return user;
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}

		} finally {
			if (session != null) {
				session.close();
			}
		}
		return null;
	}
}
