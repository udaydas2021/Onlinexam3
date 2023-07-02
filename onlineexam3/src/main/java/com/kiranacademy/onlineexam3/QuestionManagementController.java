package com.kiranacademy.onlineexam3;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuestionManagementController {

	@Autowired
	SessionFactory factory;

	@RequestMapping("addQuestion")
	public ModelAndView addQuestion(Questions questions) {
		Session session = factory.openSession();

		Transaction tx = session.beginTransaction();

		session.save(questions);

		tx.commit(); // model-data which should be displayed on jsp page

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("questionmanagement");

		modelAndView.addObject("message", "question successfully addded");

		return modelAndView;

	}

	@RequestMapping("updateQuestion")
	public ModelAndView updateQuestion(Questions questions) {
		Session session = factory.openSession();

		Transaction tx = session.beginTransaction();

		Query<Questions> query = session.createQuery(
				"update Questions set option1=:option1,option2=:option2,option3=:option3,option4=:option4,answer=:answer where qno=:qno and subject=:subject");

		query.setParameter("qno", questions.qno);
		query.setParameter("subject", questions.subject);
		query.setParameter("option1", questions.option1);
		query.setParameter("option2", questions.option2);
		query.setParameter("option3", questions.option3);
		query.setParameter("option4", questions.option4);
		query.setParameter("answer", questions.answer);

		query.executeUpdate();

		tx.commit(); // model-data which should be displayed on jsp page

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("questionmanagement");

		modelAndView.addObject("message", "question successfully updated");

		return modelAndView;

	}

	@RequestMapping("viewQuestion")
	public ModelAndView viewQuestion(Integer qno, String subject) {
		Session session = factory.openSession();

		Query<Questions> query = session.createQuery("from Questions where qno=:qno and subject=:subject");
		query.setParameter("qno", qno);
		query.setParameter("subject", subject);

		List<Questions> list = query.list();

		Questions question = list.get(0);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("questionmanagement");
		modelAndView.addObject("question", question);

		return modelAndView;
	}

	// delete from questions where qno=1 and subject='maths'

	@RequestMapping("deleteQuestion")
	public ModelAndView deleteQuestion(Questions questions) {
		Session session = factory.openSession();

		Transaction tx = session.beginTransaction();

		Query<Questions> query = session.createQuery("delete from Questions where qno=:qno and subject=:subject");

		query.setParameter("qno", questions.qno);
		query.setParameter("subject", questions.subject);

		query.executeUpdate();

		tx.commit();

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("questionmanagement");

		modelAndView.addObject("message", "question successfully deleted");

		return modelAndView;

	}

}
