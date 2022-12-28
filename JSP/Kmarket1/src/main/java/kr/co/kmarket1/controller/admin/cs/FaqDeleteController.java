package kr.co.kmarket1.controller.admin.cs;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.kmarket1.dao.ArticleDAO;
import kr.co.kmarket1.service.ArticleService;

@WebServlet("/admin/cs/faqDelete.do")
public class FaqDeleteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String group = req.getParameter("group");
		String cate = URLEncoder.encode(req.getParameter("cate"));
		String cate2 = URLEncoder.encode(req.getParameter("cate2"));
		String no = req.getParameter("no");
		
		ArticleDAO dao = ArticleDAO.getInstance();
		
		dao.deleteFaq(no);
		
		resp.sendRedirect("/Kmarket1/admin/cs/faqList.do?group="+group+"&cate="+cate+"&cate2="+cate2);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String cate2 = req.getParameter("cate2");
		String no = req.getParameter("no");
		String [] checkBoxArr = req.getParameterValues("checkBoxArr");
		int result = 0;
		
		for(int i = 0; i < checkBoxArr.length; i++) {
			result = ArticleDAO.getInstance().deleteFaq(checkBoxArr[i]);
		}
		
		// json 출력
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		String jsonData = json.toString();
		PrintWriter writer = resp.getWriter();
		writer.print(jsonData);
		
	}
	
}
