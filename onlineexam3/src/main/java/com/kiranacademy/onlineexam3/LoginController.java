package com.kiranacademy.onlineexam3;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kiranacademy.dao.LoginDAO;
import com.kiranacademy.entity.Users;
import com.kiranacademy.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	SessionFactory factory;

	@Autowired
	LoginService loginService;

	@RequestMapping("listitemex")
	public String listitemex() {
		return "listitemex";
	}

	@RequestMapping("menu")
	public String menu() {
		return "menu";
	}

	@RequestMapping("/")
	public String showlogin() {
		return "login";
	}

	@RequestMapping("showregister")
	public String showregister() {
		return "register";
	}

	@RequestMapping("validate")
	public ModelAndView validate(String username, String password, HttpServletRequest request) {
		System.out.println("username from browser " + username);
		System.out.println("password from browser " + password);

		ModelAndView modelAndView = new ModelAndView();
		Session session = factory.openSession();

		if (username.equals("admin") && password.equals("admin")) {
			modelAndView.setViewName("questionmanagement");
			modelAndView.addObject("message", "welcome " + username);
		}

		else if (loginService.validate(username, password)) {
			HttpSession httpsession = request.getSession(); // httpsession===>[] HttpSession object
			httpsession.setAttribute("username", username);// httpsession===>[username=jbk] HttpSession object

			modelAndView.setViewName("welcome");
			modelAndView.addObject("message", "welcome " + username);
		}

		else {
			modelAndView.setViewName("login");
			modelAndView.addObject("message", "invalid credentials");
		}

		return modelAndView;

	}

	@RequestMapping("startExam")
	public ModelAndView startExam(String selectedSubject, HttpServletRequest request) {
		System.out.println(selectedSubject);

		ModelAndView modelAndView = new ModelAndView();

		if (selectedSubject == null) {
			modelAndView.setViewName("login");
		} else {
			Session session = factory.openSession();

			/*
			 * Criteria is for only fetching records ( select query)
			 * HQL is for all operations (insert , update,delete,select )
			 */
			// using add() we add condition , based on which records are fetched from
			// database
			// e.g. we want only those records which are having value maths for subject
			// column ( assume selectedsubject is maths)
			// select * from questions where subject='maths'
			// List
			// listOfQuestions=session.createCriteria(Questions.class).add(Restrictions.eq("subject",selectedSubject)).list();

			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("qno", 0);
			httpsession.setAttribute("timeremaining", 121);

			Query query = session.createQuery("from Questions where subject=:subject order by rand()");
			query.setParameter("subject", selectedSubject);
			List<Questions> listOfQuestions = query.list();

			modelAndView.setViewName("questions");
			modelAndView.addObject("listOfQuestions", listOfQuestions);
			modelAndView.addObject("question", listOfQuestions.get(0));
			httpsession.setAttribute("allquestions", listOfQuestions);

			HashMap<Integer, Answer> hashmap = new HashMap<Integer, Answer>();
			httpsession.setAttribute("submittedDetails", hashmap);

			httpsession.setAttribute("score", 0);
			httpsession.setAttribute("subject", selectedSubject);
		}
		return modelAndView;

	}

}
