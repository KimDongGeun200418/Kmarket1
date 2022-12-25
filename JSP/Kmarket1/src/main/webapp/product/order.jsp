<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<jsp:include page="../_header.jsp"/>
<jsp:include page="../_menu.jsp"/>
<link rel="stylesheet" href="/Kmarket1/product/css/product_order.css">
<link rel="stylesheet" href="/Kmarket1/product/css/product.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Kmarket1/product/js/order.js"></script>
    <style>
  
    </style>
        <main id="product">
        	<!-- cate -->
        	<aside>
            	<jsp:include page="../_cate.jsp"/>
            </aside>
            <section class="order">
                <!-- title, page nav -->
                <nav>
                  	<h1>주문결제</h1>
                  	<p>
                    HOME &gt; 장바구니 &gt; <strong>주문결제</strong>
                  	</p>
                </nav>
  
                <form action="#">
                  	<!-- order List -->                  
                  	<table class="orderList">
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
                    	<c:if test="${ fn:length(orderList) == 0 }">
                   			<tr>
                       			<td colspan="7">장바구니에 상품이 없습니다.</td>
                     		</tr>
                    	</c:if>
                     	<c:forEach var="product" items="${ orderList }">
                     	<!-- 합계 구하기 -->
                     	<c:set var= "totalCount" value="${totalCount + product.count }"/>
                   		<c:set var= "totalPrice" value="${ totalPrice + product.price }"/>
                   		<c:set var= "totalDiscount" value="${totalDiscount + ((product.price * (product.discount/100))* product.count) }"/>
                   		<c:set var= "totalDelivery" value="${totalDelivery + product.delivery }"/>
                   		<c:set var= "totalPoint" value="${totalPoint + (product.count * product.point) }"/>
                      	
                      	<tr>
                      		<td><input type="checkbox" name="prodNo" value="${ product.prodNo }"></td>
                        	<td>
	                          	<article>
		                            <a href="/Kmarket1/product/productView.do?no=${ product.prodNo }"><img src="/Kmarket1/productImg/${ product.thumb1 }" alt=""></a>
		                            <div>
		                              	<h2><a href="#">${ product.prodName }</a></h2>
		                              	<p>${ product.descript }</p>
		                            </div>
	                          	</article>
	                        </td>
	                        <td><fmt:formatNumber value="${ product.count }" pattern="#,###" /></td>
	                        <td><fmt:formatNumber value="${ product.price }" pattern="#,###" /></td>
	                        <td>${ product.discount }%</td>
	                        <td><fmt:formatNumber value="${ product.point }" pattern="#,###" /></td>
	                        <td><fmt:formatNumber value="${ product.delivery }" pattern="#,###" /></td>
	                        <td><fmt:formatNumber value="${ product.total }" pattern="#,###" /></td>
                      	</tr>
                       	</c:forEach>             
                  	</tbody>
                 	</table>                 
                  
                  	<!-- order info -->
                  	<div class="final">
                  		<h2>최종결제 정보</h2>
                    	<table border="0" class="totalList">
                      		<tbody>
                      		<tr>
	                        	<td>총</td>
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
		                        <td>포인트 할인</td>
		                        <td>-0</td>
                     		</tr>
                     		<tr>
	                        	<td>적립 포인트</td>
	                        	<td><fmt:formatNumber value="${ totalPoint }" pattern="#,###" /></td>
	                      	</tr> 
	                      	<tr>
	                        	<td>전체주문금액</td>
	                        	<td><fmt:formatNumber value="${ totalPrice - totalDiscount + totalDelivery }" pattern="#,###" /></td>
	                      	</tr>                            
                    		</tbody>
                    	</table>
                    	<input type="button" name="btnOrder" value="결제하기">              
                  	</div>
                    
                  	<!-- delivery -->
                  	<article class="delivery">
                    	<h1>배송정보</h1>                          
                    	<table class="deliveryList">
                      	<tbody>
                      		<tr>
                        		<td>주문자</td>
                        		<td><input type="text" name="orderer" value="${ user.name }"/></td>
                      		</tr>
                      		<tr>
                        		<td>휴대폰</td>
                        		<td>
	                          		<input type="text" name="hp" value="${ user.hp }"/>
	                          		<span>- 포함 입력</span>
                        		</td>
                      		</tr>
                      		<tr>
                        		<td>우편번호</td>
                        		<td>
	                          		<input type="text" name="zip" value="${ user.zip }" id="zip" readonly/>
	                          		<input type="button" name="btnSearch" value="검색">
                        		</td>
                      		</tr>
                      		<tr>
		                        <td>기본주소</td>
		                        <td>
		                          	<input type="text" name="addr1" value="${ user.addr1 }" id="addr1"/>
		                        </td>
                      		</tr>
                      		<tr>
                        		<td>상세주소</td>
                        		<td>
                          			<input type="text" name="addr2" value="${ user.addr2 }" id="addr2"/>
                        		</td>
                      		</tr>
                    	</tbody>
                    	</table>
                  	</article>
  
                  	<!-- discount -->
                  	<article class="discount">
                    	<h1>할인정보</h1>
  
                    	<div>
                      		<p>현재 포인트 : <span>${ user.point }</span>점</p>
		                    <label>
		                        <input type="text" name="point"/>점
		                        <input type="button" name="apply" value="적용"/>
		                    </label>
                      		<span>포인트 5,000점 이상이면 현금처럼 사용 가능합니다.</span>
                    	</div>
                  	</article>
  
                  	<!-- payment -->
                  	<article class="payment">
                      	<h1>결제방법</h1>
                      	<div>
                          	<span>신용카드</span>
                          	<p>
                              	<label><input type="radio" name="payment" value="1">신용카드 결제</label>
                              	<label><input type="radio" name="payment" value="2">체크카드 결제</label>                                
                          	</p>
                      	</div>
                      	<div>
                          	<span>계좌이체</span>
                          	<p>
                              	<label><input type="radio" name="payment" value="3">실시간 계좌이체</label>
                              	<label><input type="radio" name="payment" value="4">무통장 입금</label>                                
                          	</p>
                      	</div>
                      	<div>
                          	<span>기타</span>
                          	<p>
                              	<label><input type="radio" name="payment" value="5">휴대폰결제</label>
                              	<label>
                                  	<input type="radio" name="payment" value="6">카카오페이
                                  	<img src="/Kmarket1/product/img/ico_kakaopay.gif" alt="카카오페이">
                              	</label>                                
                          	</p>
                      	</div>
                  	</article>
  
                  	<!-- alert -->
                  	<article class="alert">
                    	<ul>
                        	<li><span>케이마켓의 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이 모든거래에 대하여 케이마켓 유한책임회사의 구매안전서비스(에스크로)를 제공하고 있습니다.</span></li>
                        	<li><span>케이마켓 유한책임회사의 전자금융거래법에 의해 결제대금예치업 등록번호는 02-006-00008 입니다.</span></li>
                        	<li><span>등록여부는 금융감독원 홈페이지(www.fss.or.kr)의 업무자료&gt;인허가업무안내&gt;전자금융업등록현황에서 확인하실수 있습니다.</span></li>
                    	</ul>
                  	</article>
                </form>
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>