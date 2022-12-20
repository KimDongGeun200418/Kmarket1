package kr.co.kmarket1.controller.admin.cs;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket1.dao.ArticleDAO;
import kr.co.kmarket1.service.ArticleService;
import kr.co.kmarket1.vo.CsArticleVO;

@WebServlet("/admin/cs/noticeWrite.do")
public class NoticeWriteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/noticeWrite.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String group = req.getParameter("group");
		String uid = req.getParameter("uid");
		String cate = req.getParameter("type");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String regip = req.getRemoteAddr();
		
		CsArticleVO article = new CsArticleVO();
		
		article.setUid(uid);
		article.setCate(cate);
		article.setTitle(title);
		article.setContent(content);
		article.setRegip(regip);
		
		ArticleDAO.getInstance().insertArticleNotice(article);
		
		resp.sendRedirect("/Kmarket1/admin/cs/noticeList.do?group="+group);
	
	}
	
}
