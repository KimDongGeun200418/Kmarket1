package kr.co.kmarket1.service;



import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.kmarket1.dao.ProductDAO;
import kr.co.kmarket1.vo.ProductVO;

public enum ProductService {
	INSTANCE;
	private ProductDAO dao = ProductDAO.getInstance();
			
		public void insertProduct(ProductVO product) {
			dao.insertProduct(product);
		}

		public List<ProductVO> selectProducts() {
			 return dao.selectProducts();
		}

		public ProductVO selectProduct(String prodNo) {
			return dao.selectProduct(prodNo);
		}

		
		

		
		//write
		public MultipartRequest uploadFile(HttpServletRequest req, String path) throws IOException {
			int maxSize = 1024 * 1024 * 1; // 최대 파일 업로드 허용량 1MB
			return new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		}
		public String renameFile(String oriName, String path, String alt) {
			// 확장자 따오기
			int idx = oriName.lastIndexOf(".");
			String ext = oriName.substring(idx);
			// 오늘 등록된 제품 개수 세기
			int count = dao.countTodayProducts();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-");
			String now = sdf.format(new Date());
			String newName = now+count+alt+UUID.randomUUID().toString()+ext; // 221215sfdhwweew.jpg 
			
			File oriFile = new File(path+"/"+oriName);
			File newFile = new File(path+"/"+newName);
			
			oriFile.renameTo(newFile);
			return newName;
		}
		
		//list
		public List<ProductVO> selectProductsByCate(String cate1, String cate2){
			return dao.selectProductsByCate(cate1, cate2);
		}
		
		
		
	
}
