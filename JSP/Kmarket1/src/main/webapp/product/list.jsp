<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="../_menu.jsp"/>
<link rel="stylesheet" href="/Kmarket1/product/css/product_list.css">
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
                    <p>HOME &gt; <span>패션·의류·뷰티</span> &gt; <strong>남성의류</strong></p>
                </nav>
                <!-- sort menu -->
                <ul class="sort">
                    <li><a href="#" class="on">판매많은순</a></li>
                    <li><a href="#">낮은가격순</a></li>
                    <li><a href="#">높은가격순</a></li>
                    <li><a href="#">평점높은순</a></li>
                    <li><a href="#">후기많은순</a></li>
                    <li><a href="#">최근등록순</a></li>
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
                                        <span class="discount">${ product.discount }</span>
                                    </li>
                                    <li><span class="free-delivery">무료배송</span></li>
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
                    <span class="prev">
                        <a href="#">&lt; 이전</a>
                    </span>
                    <span class="num">
                        <a href="#" class="on">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">6</a>
                        <a href="#">7</a>
                    </span>
                    <span class="next">
                        <a href="#">다음&nbsp;&gt;</a>
                    </span>
                </div>
            </section>
            <!-- 새 내용 -->
        </main>
<jsp:include page="../_footer.jsp"/>