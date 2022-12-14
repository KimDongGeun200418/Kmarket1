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

@WebServlet("/admin/cs/qnaList.do")
public class QnaListController extends HttpServlet{

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
		
		int currentPage = 0;//현재 페이지 번호
		int total = 0;//전체 게시물 개수
		int lastPageNum = 0;//마지막 페이지 번호
		int[] results = null;//페이지 그룹 번호
		int pageStartNum = 0;//페이지 시작 번호
		int start = 0;//시작 인덱스
		
		List<CsArticleVO> articles = null;
		List<CsArticleVO> articles2 = null;
		List<CsArticleVO> category = service.selectQnaCate();
		List<CsArticleVO> category2 = service.selectQnaCate2(cate);
		
		if(cate == null || cate.equals("")) {
			currentPage = service.getCurrentPage(pg);//현재 페이지 번호
			total = service.selectCountQnaAll();//전체 게시물 개수
			lastPageNum = service.getLastPageNum(total);//마지막 페이지 번호
			results = service.getPageGroupNum(currentPage, lastPageNum);//페이지 그룹 번호
			pageStartNum = service.getPageStartNum(total, currentPage);//페이지 시작 번호
			start = service.getStartNum(currentPage);//시작 인덱스		
			
			articles = service.selectAllQna(start);
		}else if(cate != null && cate2 != null){
			currentPage = service.getCurrentPage(pg);//현재 페이지 번호
			total = service.selectCountQna2(cate, cate2);//전체 게시물 개수
			lastPageNum = service.getLastPageNum(total);//마지막 페이지 번호
			results = service.getPageGroupNum(currentPage, lastPageNum);//페이지 그룹 번호
			pageStartNum = service.getPageStartNum(total, currentPage);//페이지 시작 번호
			start = service.getStartNum(currentPage);//시작 인덱스		
			
			articles = service.selectQna2(cate, cate2, start);
		}else if(cate != null && (cate2 == null || cate2.equals(""))){
			currentPage = service.getCurrentPage(pg);//현재 페이지 번호
			total = service.selectCountQna(cate);//전체 게시물 개수
			lastPageNum = service.getLastPageNum(total);//마지막 페이지 번호
			results = service.getPageGroupNum(currentPage, lastPageNum);//페이지 그룹 번호
			pageStartNum = service.getPageStartNum(total, currentPage);//페이지 시작 번호
			start = service.getStartNum(currentPage);//시작 인덱스		
			
			articles = service.selectQna(cate, start);
		}
	
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("pageGroupStart", results[0]);
		req.setAttribute("pageGroupEnd", results[1]);
		req.setAttribute("pageStartNum", pageStartNum +1);
		
		req.setAttribute("articles", articles);
		req.setAttribute("category", category);
		req.setAttribute("category2", category2);
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("cate2", cate2);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/qnaList.jsp");
		dispatcher.forward(req, resp);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}
