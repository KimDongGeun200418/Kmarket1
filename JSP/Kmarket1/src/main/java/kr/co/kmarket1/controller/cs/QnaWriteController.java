package kr.co.kmarket1.controller.cs;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket1.dao.ArticleDAO;
import kr.co.kmarket1.service.ArticleService;
import kr.co.kmarket1.vo.CsArticleVO;

@WebServlet("/cs/qna/write.do")
public class QnaWriteController extends HttpServlet{

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
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/qna/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String group = req.getParameter("group");
		String uid = req.getParameter("uid");
		String cate = req.getParameter("type1");
		String cate2 = req.getParameter("type2");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String regip = req.getRemoteAddr();
		
		CsArticleVO article = new CsArticleVO();
		
		article.setUid(uid);
		article.setCate(cate);
		article.setCate2(cate2);
		article.setTitle(title);
		article.setContent(content);
		article.setRegip(regip);
		
		ArticleDAO.getInstance().insertArticleQna(article);
		
		resp.sendRedirect("/Kmarket1/cs/qna/list.do?group="+group+"&cate="+URLEncoder.encode(cate));
	
	}
	
}
