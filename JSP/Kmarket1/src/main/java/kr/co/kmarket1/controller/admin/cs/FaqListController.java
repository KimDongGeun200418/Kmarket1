package kr.co.kmarket1.controller.admin.cs;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket1.service.ArticleService;
import kr.co.kmarket1.vo.CsArticleVO;

@WebServlet("/admin/cs/faqList.do")
public class FaqListController extends HttpServlet{

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
		
		List<CsArticleVO> articles = null;
		List<CsArticleVO> category = service.selectFaqCate();
		List<CsArticleVO> category2 = service.selectFaqCate2(cate);
		
		if(cate == null || cate.equals("")) {
			
			articles = service.selectAllFaq();
		}else {
			
			articles = service.selectFaq(cate);
		}
	
		req.setAttribute("articles", articles);
		req.setAttribute("category", category);
		req.setAttribute("category2", category2);
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("cate2", cate2);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/faqList.jsp");
		dispatcher.forward(req, resp);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
