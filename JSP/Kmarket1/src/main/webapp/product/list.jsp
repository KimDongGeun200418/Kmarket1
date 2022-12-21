<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="../_menu.jsp"/>
<link rel="stylesheet" href="/Kmarket1/product/css/product_list.css">
<link rel="stylesheet" href="/Kmarket1/product/css/product.css">
    <style>
      
    </style>
        <main id="product">
            <!-- cate -->
            <aside>
            	<jsp:include page="../_cate.jsp"/>
            </aside>
            <!-- 새 내용 -->
            <section class="list">
                <!-- title, page nav -->
                <nav>
                    <h1>상품목록</h1>
                    <p>HOME &gt; <span>${ navCate.cate1 }</span> &gt; <strong>${ navCate.cate2 }</strong></p>
                </nav>
                <!-- sort menu -->
                <ul class="sort">
                    <li><a href="/Kmarket1/product/productList.do?cate1=${ cate1 }&cate2=${ cate2 }&option=sold" class="${option eq 'sold' ? 'on':'off'}">판매많은순</a></li>
                    <li><a href="/Kmarket1/product/productList.do?cate1=${ cate1 }&cate2=${ cate2 }&option=low" class="${option eq 'low' ? 'on':'off'}">낮은가격순</a></li>
                    <li><a href="/Kmarket1/product/productList.do?cate1=${ cate1 }&cate2=${ cate2 }&option=high" class="${option eq 'high' ? 'on':'off'}">높은가격순</a></li>
                    <li><a href="/Kmarket1/product/productList.do?cate1=${ cate1 }&cate2=${ cate2 }&option=score" class="${option eq 'score' ? 'on':'off'}">평점높은순</a></li>
                    <li><a href="/Kmarket1/product/productList.do?cate1=${ cate1 }&cate2=${ cate2 }&option=review" class="${option eq 'review' ? 'on':'off'}">후기많은순</a></li>
                    <li><a href="/Kmarket1/product/productList.do?cate1=${ cate1 }&cate2=${ cate2 }&option=latest" class="${option eq 'latest' ? 'on':'off'}">최근등록순</a></li>
                </ul>
                <!-- product list -->
                <table border="0">                  
                    <tbody>
                    	<c:forEach var="product" items="${ products }">
                        <tr>
                            <td>
                                <a href="/Kmarket1/product/productView.do?prodNo=${ product.prodNo }" class="thumb"><img src="/Kmarket1/productImg/${ product.thumb1 }" alt="상품이미지"></a>
                            </td>
                            <td>
                                <h3 class="name">${ product.prodName }</h3>
                                <a href="/Kmarket1/product/productView.do?prodNo=${ product.prodNo }" class="desc"> ${ product.descript }</a>
                            </td>
                            <td>
                                <ul>
                                    <li><ins class="dis-price"><fmt:formatNumber value="${ product.price * (1-(product.discount/100)) }"  pattern="#,###" /></ins></li>
                                    <li>
                                        <del class="org-price"><fmt:formatNumber value="${ product.price }"  pattern="#,###" /></del>
                                        <span class="discount">${ product.discount }%</span>
                                    </li>
                                    <c:choose>
			                  			<c:when test="${ product.delivery == '0' }">
			                  				<span class="free">무료배송</span>
			                  			</c:when>
			                  			<c:otherwise>
			                  				<span class="delivery">배송비 <fmt:formatNumber value="${ product.delivery }"  pattern="#,###" /></span>
			                  			</c:otherwise>
			               			</c:choose>
                                </ul>
                            </td>
                            <td>
                                <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i>&nbsp;${ product.seller }</h4>
                                <h5 class="badge power">판매자등급</h5>
                                <h6 class="rating star1">상품평</h6>
                            </td>
                        </tr>
                        </c:forEach>
                        
                        <tr>
                            <td>
                                <a href="#" class="thumb"><img src="https://via.placeholder.com/120x120" alt="상품이미지"></a>
                            </td>
                            <td>
                                <h3 class="name">상품명</h3>
                                <a href="#" class="desc">상품설명</a>
                            </td>
                            <td>
                                <ul>
                                    <li><ins class="dis-price">27,000</ins></li>
                                    <li>
                                        <del class="org-price">30,000</del>
                                        <span class="discount">10%</span>
                                    </li>
                                    <li><span class="free-delivery">무료배송</span></li>
                                </ul>
                            </td>
                            <td>
                                <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i>&nbsp;판매자</h4>
                                <h5 class="badge power">판매자등급</h5>
                                <h6 class="rating star2">상품평</h6>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="#" class="thumb"><img src="https://via.placeholder.com/120x120" alt="상품이미지"></a>
                            </td>
                            <td>
                                <h3 class="name">상품명</h3>
                                <a href="#" class="desc">상품설명</a>
                            </td>
                            <td>
                                <ul>
                                    <li><ins class="dis-price">27,000</ins></li>
                                    <li>
                                        <del class="org-price">30,000</del>
                                        <span class="discount">10%</span>
                                    </li>
                                    <li><span class="free-delivery">무료배송</span></li>
                                </ul>
                            </td>
                            <td>
                                <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i>&nbsp;판매자명</h4>
                                <h5 class="badge power">판매자등급</h5>
                                <h6 class="rating star3">상품평</h6>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- page number -->
                <div class="paging">
					<c:if test="${pageGroupStart > 1}">
					<span class="prev">
		            	<a href="/Kmarket1/product/productList.do?cate1=${ cate1 }&cate2=${ cate2 }&option=${ option }&pg=${pageGroupStart - 1}">&lt; 이전</a>
		            </span>
		            </c:if>
		            <span class="num">
		            <c:forEach var="num" begin="${pageGroupStart}" end="${pageGroupEnd}">
		            	<a href="/Kmarket1/product/productList.do?cate1=${ cate1 }&cate2=${ cate2 }&option=${ option }&pg=${num}" class="${num == currentPage ? 'on':'off'}">${num}</a>
		            </c:forEach>
		            </span>
		            <c:if test="${pageGroupEnd < lastPageNum}">
		            <span class="next">
		            	<a href="/Kmarket1/product/productList.do?cate1=${ cate1 }&cate2=${ cate2 }&option=${ option }&pg=${pageGroupEnd + 1}" class="next">다음&nbsp;&gt;</a>
		            </span>
		            </c:if>
                </div>
            </section>
            <!-- 새 내용 -->
        </main>
<jsp:include page="../_footer.jsp"/>