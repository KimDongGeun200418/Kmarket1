<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_menu.jsp"/>
<link rel="stylesheet" href="/Kmarket1/product/css/product_cart.css">
<link rel="stylesheet" href="/Kmarket1/product/css/product.css">
<script src="/Kmarket1/product/js/cart.js"></script>
    <style>
        

    </style>
        <main id="product">
            <!-- cate -->
            <aside>
            	<jsp:include page="../_cate.jsp"/>
            </aside>
            
            <section class="cart">
                <!-- 제목, 페이지 네비게이션 -->
                <nav>
                	<h1>장바구니</h1>
                	<p>HOME &gt; <span>마이페이지</span> &gt; <strong>장바구니</strong></p>
                </nav>
                              
                <form action="#">
                	<!-- 장바구니 목록 -->
                	<table>
                    	<thead>
                      		<tr>
	                        	<th><input type="checkbox" name="all"></th>
		                        <th>상품명</th>
		                        <th>총수량</th>
		                        <th>판매가</th>
		                        <th>할인</th>
		                        <th>포인트</th>
		                        <th>배송비</th>
		                        <th>소계</th>
	                      	</tr>
                    	</thead>
                    	<tbody>
                    		<c:if test="${ fn:length(cartProducts) == 0 }">
                   			<tr>
                       			<td colspan="7">장바구니에 상품이 없습니다.</td>
                     		</tr>
                    		</c:if>
                    		
                    		<c:forEach var="cartProduct" items="${ cartProducts }">
                    		<!-- 합계 구하기 -->
                    		<c:set var= "totalCount" value="${totalCount + cartProduct.count }"/>
                    		<c:set var= "totalPrice" value="${totalPrice + (cartProduct.price*cartProduct.count) }"/>
                    		<c:set var= "totalDiscount" value="${totalDiscount + ((cartProduct.price * (cartProduct.discount/100))* cartProduct.count) }"/>
                    		<c:set var= "totalDelivery" value="${totalDelivery + cartProduct.delivery }"/>
                    		<c:set var= "totalPoint" value="${totalPoint + (cartProduct.count * cartProduct.point) }"/>
                      		<tr>
		                        <td><input type="checkbox" name="cartNo" value="${ cartProduct.cartNo }"></td>
		                        <td>
		                        	<article>
		                            <a href="/Kmarket1/product.do?no=${ cartProduct.prodNo }"><img src="/Kmarket1/productImg/${ cartProduct.thumb1 }" alt=""></a>
		                            <div>
		                            	<h2><a href="#">${ cartProduct.prodName }</a></h2>
		                            	<p>${ cartProduct.descript }</p>
		                            </div>
		                          	</article>
		                        </td>
		                        <td><fmt:formatNumber value="${ cartProduct.count }" pattern="#,###" /></td>
		                        <td><fmt:formatNumber value="${ cartProduct.price }" pattern="#,###" /></td>
		                        <td>${ cartProduct.discount }</td>
		                        <td><fmt:formatNumber value="${ cartProduct.point }" pattern="#,###" /></td>
		                        <td><fmt:formatNumber value="${ cartProduct.delivery }" pattern="#,###" /></td>
		                        <td><fmt:formatNumber value="${ cartProduct.total }" pattern="#,###" /></td>
		                    </tr>
                      		</c:forEach>
                  		</tbody>
                  	</table>
                  	<input type="button" name="del" value="선택삭제">
  
                  	<!-- 장바구니 전체합계 -->
                  	<c:choose>
                  		<c:when test="${ fn:length(cartProducts) == 0 }">
                  			<div class="total empty">
                  		</c:when>
                  		<c:otherwise>
                  			<div class="total">
                  		</c:otherwise>
                  	</c:choose>
                    	<h2>전체합계</h2>
                    	<table border="0">
                      	<tbody>
                      		<tr>
                        		<td>상품수</td>
                        		<td><fmt:formatNumber value="${ totalCount }" pattern="#,###" /></td>
                      		</tr>
		                    <tr>
		                        <td>상품금액</td>
		                        <td><fmt:formatNumber value="${ totalPrice }" pattern="#,###" /></td>
		                    </tr>
                      		<tr>
                        		<td>할인금액</td>
                        		<td>-<fmt:formatNumber value="${ totalDiscount }" pattern="#,###" /></td>
                      		</tr>
                      		<tr>
                        		<td>배송비</td>
                        		<td><fmt:formatNumber value="${ totalDelivery }" pattern="#,###" /></td>
                      		</tr>              
                      		<tr>
                        		<td>포인트</td>
                        		<td><fmt:formatNumber value="${ totalPoint }" pattern="#,###" /></td>
                      		</tr>
                      		<tr>
                        		<td>전체주문금액</td>
                        		<td><fmt:formatNumber value="${ totalPrice - totalDiscount }" pattern="#,###" /></td>
                      		</tr>
                    	</tbody>
                    	</table>
                    	<input type="submit" name="" value="주문하기">    
                  	</div>
                </form>
              </section>
        </main>
<jsp:include page="../_footer.jsp"/>