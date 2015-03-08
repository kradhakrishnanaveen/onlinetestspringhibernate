package com.spaneos.onlinetest.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spaneos.onlinetest.pojo.Category;
import com.spaneos.onlinetest.pojo.NormalFeedBack;
import com.spaneos.onlinetest.pojo.NormalTest;
import com.spaneos.onlinetest.pojo.TestQuestions;
import com.spaneos.onlinetest.pojo.TestSection;
import com.spaneos.onlinetest.pojo.User;
import com.spaneos.onlinetest.service.OnlineTestService;

@Controller
public class OnlineTestServlet {

	@Autowired
	OnlineTestService onlineTestServiceImp;

	public OnlineTestService getOnlineTestServiceImp() {
		return onlineTestServiceImp;
	}

	public void setOnlineTestServiceImp(OnlineTestService onlineTestServiceImp) {
		this.onlineTestServiceImp = onlineTestServiceImp;
	}

	@RequestMapping(value = "/addquestion.do", method = RequestMethod.POST)
	public String addNewQuestion(Model model, HttpServletRequest request) {

		String sectionId = request.getParameter("section");
		long sid = Long.parseLong(sectionId);
		String question = request.getParameter("question");
		String opt1 = request.getParameter("opt1");
		String opt2 = request.getParameter("opt2");
		String opt3 = request.getParameter("opt3");
		String opt4 = request.getParameter("opt4");
		String opt5 = request.getParameter("opt5");
		if (opt5 == "" || opt5 == null)
			opt5 = null;
		String correctans = request.getParameter("correctans");
		String explanation = request.getParameter("explanation");
		if (explanation == "" || explanation == null)
			explanation = null;
		TestQuestions testQuestions = new TestQuestions(0, question, opt1,
				opt2, opt3, opt4, opt5, correctans, explanation,
				onlineTestServiceImp.getSectionById(sid));

		if (onlineTestServiceImp.addTestQuestions(testQuestions, sid)) {
			model.addAttribute("message", "Question Added Successfully");
		} else {
			model.addAttribute("message", "Question Not Added Successfully");
		}
		List<TestSection> sectionList = onlineTestServiceImp
				.getAllSectionsByCategoryId(onlineTestServiceImp
						.getSectionById(sid).getCategory().getcId());
		model.addAttribute("sectionList", sectionList);

		return "addQuestion";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginValidate(Model model, String uname, String pwd,
			HttpServletRequest request) {

		if (uname == null || uname == "" || pwd == null || pwd == "") {
			return "redirect:Login_page.jsp";
		} else {
			User user = onlineTestServiceImp.authenticateUser(uname, pwd);
			if (user == null) {
				model.addAttribute("message",
						"Please Enter Valid Username or Password");
				return "Login_page";
			} else {

				if (uname.equals(user.getEmail())
						&& pwd.equals(user.getPassword())) {
					HttpSession session = request.getSession();
					System.out.println(session.getId());
					if (uname.equals("admin@gmail.com")) {
						session.setAttribute("myadmin", "iamtheadmin");
					} else{
						session.setAttribute("myadmin", null);
					}
					session.setAttribute("uid", user.getuId());
					session.setAttribute("uname", user.getuName());

					return "redirect:homepage.do";
				} else {
					model.addAttribute("message",
							"Please Enter Valid Username or Password");
					return "Login_page";
				}
				/*
				 * } else { String name = (String)
				 * session.getAttribute("uname"); if (name == null || name ==
				 * "") { return "redirect:Login_page.jsp"; } else { return
				 * homePage(model, session); } }
				 */
			}
		}
	}

	@RequestMapping(value = "/subhomepage.do", method = RequestMethod.GET)
	public String subHomePage(Model model, HttpSession session, String cId) {

		if (session == null) {
			return "redirect:Login_page";
		} else {
			long id = Long.parseLong(cId);
			Category category = onlineTestServiceImp.getCategoryById(id);
			model.addAttribute("category", category);
			return "subhomepage";
		}
	}

	@RequestMapping(value = "/homepage.do")
	public String homePage(Model model, HttpSession session) {

		if (session == null) {
			return "Login_page";
		} else {
			List<Category> listCategories = onlineTestServiceImp
					.getAllCategories();
			model.addAttribute("listCategories", listCategories);
			return "homepage";
		}
	}

	@RequestMapping(value = "/instructions.do", method = RequestMethod.GET)
	public String instructions(Model model, HttpSession session, String sid) {

		if (session == null) {
			return "redirect:Login_page.jsp";
		} else {

			long sId = Integer.parseInt(sid);
			TestSection testSection = onlineTestServiceImp.getSectionById(sId);
			session.setAttribute("testSection", testSection);
			model.addAttribute("sid", sId);
			return "instructions";
		}
	}

	@RequestMapping(value = "/begintest.do", method = RequestMethod.GET)
	public String beginTest(Model model, HttpSession session, String sid) {

		if (session == null) {
			return "redirect:Login_page.jsp";
		} else {
			model.addAttribute("sid", sid);
			return "begintest";
		}
	}

	@RequestMapping(value = "/startexam.do", method = RequestMethod.GET)
	public String startNewExam(Model model, HttpSession session) {
		if (session == null) {
			return "redirect:Login_page.jsp";
		} else {
			Object obj = session.getAttribute("testSection");
			if (obj == null) {
				return homePage(model, session);
			} else {

				TestSection testSection = (TestSection) obj;
				Map<Long, String> lisAnswers = new TreeMap<Long, String>();
				Map<Long, String> listFlags = new TreeMap<Long, String>();
				Map<Long, TestQuestions> lisQuestions = new TreeMap<Long, TestQuestions>();

				for (TestQuestions testQuestions : testSection
						.getListQuestions()) {
					lisAnswers.put(testQuestions.getqId(), null);
					listFlags.put(testQuestions.getqId(), "flag");
					lisQuestions.put(testQuestions.getqId(), testQuestions);
				}
				model.addAttribute("testQuestion", testSection
						.getListQuestions().get(0));
				session.setAttribute("firstqid", testSection.getListQuestions()
						.get(0).getqId());
				session.setAttribute("lastqid", testSection.getListQuestions()
						.get(testSection.getListQuestions().size() - 1)
						.getqId());
				session.setAttribute("testSection", testSection);
				model.addAttribute("answercount", getAnswerCount(lisAnswers));
				model.addAttribute(
						"lisAnswers",
						lisAnswers.get(testSection.getListQuestions().get(0)
								.getqId()));
				model.addAttribute(
						"flagvar",
						listFlags.get(testSection.getListQuestions().get(0)
								.getqId()));
				session.setAttribute("answerList", lisAnswers);
				session.setAttribute("flagList", listFlags);
				session.setAttribute("questionsList", lisQuestions);
				return "examportal";
			}
		}
	}

	@RequestMapping(value = "/getnewquestion.do", method = RequestMethod.GET)
	public String getNewQuestion(Model model, HttpSession session, String qid,
			String flag, String answer) {

		if (session == null) {
			return "redirect:Login_page.jsp";
		} else {

			long qId = Long.parseLong(qid);
			Map<Long, String> lisAnswers = (Map<Long, String>) session
					.getAttribute("answerList");
			Map<Long, String> listFlags = (Map<Long, String>) session
					.getAttribute("flagList");
			lisAnswers.put(qId, answer);
			listFlags.put(qId, flag);
			session.setAttribute("answerList", lisAnswers);
			session.setAttribute("flagList", listFlags);
			long quesid = qId + 1;
			Map<Long, TestQuestions> lisQuestions = (Map<Long, TestQuestions>) session
					.getAttribute("questionsList");
			model.addAttribute("testQuestion", lisQuestions.get(quesid));
			model.addAttribute("flagvar", listFlags.get(quesid));
			model.addAttribute("lisAnswers", lisAnswers.get(quesid));
			model.addAttribute("answercount", getAnswerCount(lisAnswers));
			return "subexamportal";
		}
	}

	@RequestMapping(value = "/getpreviousquestion.do", method = RequestMethod.GET)
	public String getPreviousQuestion(Model model, HttpSession session,
			String qid) {

		if (session == null) {
			return "redirect:Login_page.jsp";
		} else {

			long qId = Long.parseLong(qid);
			Map<Long, String> lisAnswers = (Map<Long, String>) session
					.getAttribute("answerList");
			Map<Long, String> listFlags = (Map<Long, String>) session
					.getAttribute("flagList");
			Map<Long, TestQuestions> lisQuestions = (Map<Long, TestQuestions>) session
					.getAttribute("questionsList");
			model.addAttribute("testQuestion", lisQuestions.get(qId));
			model.addAttribute("flagvar", listFlags.get(qId));
			model.addAttribute("lisAnswers", lisAnswers.get(qId));
			model.addAttribute("answercount", getAnswerCount(lisAnswers));
			return "subexamportal";
		}
	}

	@RequestMapping(value = "/savelastquestion.do", method = RequestMethod.POST)
	public String SaveLastQuestion(Model model, HttpSession session,
			String qid, String flag, String answer) {

		if (session == null) {
			return "redirect:Login_page.jsp";
		} else {

			long qId = Long.parseLong(qid);
			Map<Long, String> lisAnswers = (Map<Long, String>) session
					.getAttribute("answerList");
			Map<Long, String> listFlags = (Map<Long, String>) session
					.getAttribute("flagList");
			Map<Long, TestQuestions> lisQuestions = (Map<Long, TestQuestions>) session
					.getAttribute("questionsList");
			lisAnswers.put(qId, answer);
			listFlags.put(qId, flag);
			model.addAttribute("testQuestion", lisQuestions.get(qId));
			model.addAttribute("flagvar", listFlags.get(qId));
			model.addAttribute("lisAnswers", lisAnswers.get(qId));
			model.addAttribute("answercount", getAnswerCount(lisAnswers));
			session.setAttribute("answerList", lisAnswers);
			session.setAttribute("flagList", listFlags);
			return "examportal";
		}

	}

	@RequestMapping(value = "/submittest.do", method = RequestMethod.GET)
	public String submitTest(Model model, HttpSession session, String sid) {

		if (session == null) {
			return "redirect:Login_page.jsp";
		} else {
			int ccount = 0;
			int wcount = 0;
			int ncount = 0;

			Object obj = session.getAttribute("testSection");
			if (obj == null) {
				return homePage(model, session);
			} else {

				TestSection testSection = (TestSection) obj;

				Map<Long, String> lisAnswers = (Map<Long, String>) session
						.getAttribute("answerList");
				NormalTest normalTest = new NormalTest();
				normalTest.setTestSection(testSection);
				normalTest.settDate(new Date());
				List<NormalFeedBack> listNormalFeedBack = new ArrayList<NormalFeedBack>();

				for (TestQuestions test : testSection.getListQuestions()) {
					NormalFeedBack normalFeedBack = new NormalFeedBack();
					String testanswer = test.getAnswer();
					String givanswer = lisAnswers.get(test.getqId());
					normalFeedBack.setAnswerCorrect(testanswer);
					normalFeedBack.setqId(test.getqId());
					String testans[] = testanswer.split(",");
					if (givanswer == null) {
						ncount++;
						normalFeedBack.setResult("wrong");
						normalFeedBack.setAnswerGiven("Not Attempted");
					} else {
						String givans[] = givanswer.split(",");
						boolean flag = false;
						for (String s : givans) {
							if (!s.equalsIgnoreCase("Z")) {
								flag = true;
								break;
							}
						}
						if (!flag) {
							ncount++;
							normalFeedBack.setAnswerGiven("Not Attempted");
							normalFeedBack.setResult("wrong");
						}
						flag = false;
						int c = 0;
						StringBuffer sb = new StringBuffer();
						for (String s : givans) {
							if (!s.equalsIgnoreCase("Z")) {
								c++;
								sb.append(s + ",");
							}
						}
						if (c == 0) {
							lisAnswers.put(test.getqId(), null);
							normalFeedBack.setAnswerGiven("Not Attempted");
						} else {
							String str = sb.toString();
							normalFeedBack.setAnswerGiven(str.substring(0,
									str.length() - 1));
							lisAnswers.put(test.getqId(),
									str.substring(0, str.length() - 1));
						}
						if (c == testans.length) {
							for (String an : testans) {
								if (!givanswer.contains(an)) {
									flag = true;
									break;
								}
							}
							if (!flag) {
								ccount++;
								normalFeedBack.setResult("correct");
							} else {
								wcount++;
								normalFeedBack.setResult("wrong");
							}

						} else {
							wcount++;
							normalFeedBack.setResult("wrong");
						}
					}
					listNormalFeedBack.add(normalFeedBack);
				}
				normalTest.settMarks(ccount);
				normalTest.setListNormalFeedBack(listNormalFeedBack);
				long tId = onlineTestServiceImp.addTestDetails(normalTest,
						(Long) session.getAttribute("uid"));

				if (tId != 0) {
					model.addAttribute("userid", session.getAttribute("uid"));
					model.addAttribute("testid", tId);
					model.addAttribute("correctcount", ccount);
					model.addAttribute("wrongcount", testSection
							.getListQuestions().size() - ncount - ccount);
					model.addAttribute("notcount", ncount);
					session.setAttribute("testSection", null);
					return "displayresult";
				}
			}
		}
		return homePage(model, session);
	}

	@RequestMapping(value = "/getentireresult.do", method = RequestMethod.GET)
	public String getEntireResult(Model model, HttpSession session, String uid,
			String tid) {

		if (session == null) {
			return "redirect:Login_page.jsp";
		} else {

			long testid = Long.parseLong(tid);
			model.addAttribute("uid", uid);
			model.addAttribute("tid", tid);
			NormalTest normalTest = onlineTestServiceImp.getTestDetails(testid);
			Map<Long, String> lisAnswers = new TreeMap<Long, String>();
			Map<Long, String> lisResult = new TreeMap<Long, String>();
			for (NormalFeedBack normalFeedBack : normalTest
					.getListNormalFeedBack()) {
				lisAnswers.put(normalFeedBack.getqId(),
						normalFeedBack.getAnswerGiven());
				lisResult.put(normalFeedBack.getqId(),
						normalFeedBack.getResult());
			}
			model.addAttribute("normaltest", normalTest);
			model.addAttribute("lisAnswers", lisAnswers);
			model.addAttribute("lisResult", lisResult);
			return "getentireresult";
		}
	}

	@RequestMapping(value = "/addsection.do", method = RequestMethod.POST)
	public String addSection(Model model, HttpSession session,
			HttpServletRequest request) {
		String categoryId = request.getParameter("category");
		long cid = Long.parseLong(categoryId);
		String sname = request.getParameter("sname");
		String sdescription = request.getParameter("sdescription");
		String stime = request.getParameter("stime");
		int sTime = Integer.parseInt(stime);
		TestSection testSection = new TestSection(0, sname, sdescription,
				sTime, onlineTestServiceImp.getCategoryById(cid), null);
		if (onlineTestServiceImp.addTestSection(testSection, cid)) {
			model.addAttribute("message", "Section Added Successfully");
		} else {
			model.addAttribute("message", "Section Not Added Successfully");
		}
		List<Category> categoryList = onlineTestServiceImp.getAllCategories();
		model.addAttribute("categoryList", categoryList);
		return "addSection";
	}

	@RequestMapping(value = "/addcategory.do", method = RequestMethod.POST)
	public String addCategory(Model model, HttpSession session,
			HttpServletRequest request) {
		String cname = request.getParameter("cname");
		String cdescription = request.getParameter("cdescription");
		Category category = new Category(0, cname, cdescription, null);
		if (onlineTestServiceImp.addCategory(category)) {
			model.addAttribute("message", "Category Added Successfully");
		} else {
			model.addAttribute("message", "Category not Added Successfully");
		}
		return "addCategory";
	}

	@RequestMapping(value = "/addquestionstart.do", method = RequestMethod.GET)
	public String addNewQuestion(Model model, HttpSession session, String cid) {

		long cId = Long.parseLong(cid);
		List<TestSection> sectionList = onlineTestServiceImp
				.getAllSectionsByCategoryId(cId);
		model.addAttribute("sectionList", sectionList);
		return "addQuestion";
	}

	@RequestMapping(value = "/displaysection.do")
	public String displaySection(Model model, HttpSession session, String cid) {
		long id = Long.parseLong(cid);
		List<TestSection> listOfSect = onlineTestServiceImp
				.getAllSectionsByCategoryId(id);
		model.addAttribute("list", listOfSect);
		return "displaysection";

	}

	@RequestMapping(value = "/addsectionstart.do", method = RequestMethod.GET)
	public String addNewSection(Model model, HttpSession session) {
		List<Category> categoryList = onlineTestServiceImp.getAllCategories();
		model.addAttribute("categoryList", categoryList);
		return "addSection";
	}

	public int getAnswerCount(Map<Long, String> lisAnswers) {
		int count = 0;
		Set<Long> keys = lisAnswers.keySet();
		for (Long key : keys) {
			String s = lisAnswers.get(key);
			if (s != null) {
				if (s.contains("A") || s.contains("B") || s.contains("C")
						|| s.contains("D") || s.contains("E")) {
					count++;
				}
			}
		}
		return count;
	}

	@RequestMapping(value = "/logout")
	public String logOut(Model model, HttpSession session) {
		if (session == null) {
			return "redirect:Login_page.jsp";
		} else {
			session.invalidate();
			return "redirect:Login_page.jsp";
		}
	}

	@RequestMapping(value = "/gettestdetails.do")
	public String getTestDetails(Model model, HttpSession session) {
		if (session == null) {
			return "redirect:Login_page.jsp";
		} else {
			long uId = (long) session.getAttribute("uid");
			List<NormalTest> listNormalTest = onlineTestServiceImp
					.getTestDetailsByUserId(uId);
			model.addAttribute("testDetails", listNormalTest);
		}
		return "getTestDetails";
	}
}
