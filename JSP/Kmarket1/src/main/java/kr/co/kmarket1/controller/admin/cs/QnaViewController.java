package kr.co.kmarket1.controller.admin.cs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket1.service.ArticleService;
import kr.co.kmarket1.vo.CsArticleVO;

@WebServlet("/admin/cs/qnaView.do")
public class QnaViewController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String cate2 = req.getParameter("cate2");
		String pg = req.getParameter("pg");
		String no = req.getParameter("no");
		
		CsArticleVO article = service.selectArticleQna(no);
	
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("cate2", cate2);
		req.setAttribute("pg", pg);
		req.setAttribute("no", no);
		req.setAttribute("article", article);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/qnaView.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
