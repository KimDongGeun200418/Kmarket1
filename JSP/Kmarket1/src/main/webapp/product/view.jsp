<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import="java.util.Date" %> 
<jsp:include page="../_header.jsp"/>
<jsp:include page="../_menu.jsp"/>
<link rel="stylesheet" href="/Kmarket1/product/css/product_view.css">
<link rel="stylesheet" href="/Kmarket1/product/css/product.css">
<script src="/Kmarket1/product/js/view.js"></script>
    <style>
        
    </style>
        <main id="product">
            <!-- cate -->
            <aside>
            	<jsp:include page="../_cate.jsp"/>
            </aside>
            <section class="view">

                <!-- title, page nav -->
                <nav>
                    <h1>상품보기</h1>
                    <p>HOME &gt; <span>${ navCate.cate1 }</span> &gt; <strong>${ navCate.cate2 }</strong></p>
                </nav>

                <!-- product info -->                
                <article class="info">
                    <div class="image">
                        <img src="/Kmarket1/productImg/${ product.thumb3 }" alt="상품이미지">
                    </div>
                    <div class="summary">
                    	<input type="hidden" name="uid" value="${ loginUser.uid }"/>
                    	<input type="hidden" name="prodNo" value="${ product.prodNo }"/>
                    	<input type="hidden" name="price" value="${ product.price }"/>
                    	<input type="hidden" name="discount" value="${ product.discount }"/>
                    	<input type="hidden" name="point" value="${ product.point }"/>
                    	<input type="hidden" name="delivery" value="${ product.delivery }"/>
                        <nav>
                            <h1>${ product.seller }</h1>
                            <h2>상품번호&nbsp;:&nbsp;<span>${ product.cate1 }${ product.cate2 }<fmt:formatNumber type="number" pattern="###" minIntegerDigits="6" value="${ product.prodNo }" /></span></h2>
                        </nav>                        
                        <nav>
                            <h3>${ product.prodName }</h3>
                            <c:choose>
                            	<c:when test="${ product.score >= 4.5 }">
                            		<h5 class="rating star5"><a href="#">상품평보기</a></h5>
                            	</c:when>
                            	<c:when test="${ product.score >= 3.5 }">
                            		<h5 class="rating star4"><a href="#">상품평보기</a></h5>
                            	</c:when>
                            	<c:when test="${ product.score >= 2.5 }">
                            		<h5 class="rating star3"><a href="#">상품평보기</a></h5>
                            	</c:when>
                            	<c:when test="${ product.score >= 1.5 }">
                            		<h5 class="rating star2"><a href="#">상품평보기</a></h5>
                            	</c:when>
                            	<c:when test="${ product.score >= 0.5 }">
                            		<h5 class="rating star1"><a href="#">상품평보기</a></h5>
                            	</c:when>
                            	<c:when test="${ product.score < 0.5 }">
                            		<h5 class="rating star0"><a href="#">상품평보기</a></h5>
                            	</c:when>
                            </c:choose>
                            
                        </nav>
                        <nav>
                            <div class="org_price">
                                <del><fmt:formatNumber value="${ product.price }"  pattern="#,###" /></del>
                                <span>${ product.discount }%</span>
                            </div>
                            <div class="dis_price">
                                <ins><fmt:formatNumber value="${ product.price * (1-(product.discount/100)) }"  pattern="#,###" /></ins>
                            </div>
                        </nav>
                        <nav>
                        	<c:choose>
	                  			<c:when test="${ product.delivery == '0' }">
	                  				<span class="delivery">무료배송</span>
	                  			</c:when>
	                  			<c:otherwise>
	                  				<span class="delivery">배송비 ${ product.delivery }</span>
	                  			</c:otherwise>
                  			</c:choose>
                  			<c:set var="oneDayAfter" value="<%=new Date(new Date().getTime() + 60*60*24*1000*3)%>"/>
                            <span class="arrival"><fmt:formatDate value="${oneDayAfter}" pattern="MM/dd(E) "/>도착예정</span>
                            <span class="desc">${ product.descript }</span>
                        </nav>
                        <nav>
                            <span class="card cardfree"><i>아이콘</i>무이자할부</span>&nbsp;&nbsp;
                            <span class="card cardadd"><i>아이콘</i>카드추가혜택</span>
                        </nav>
                        <nav>
                            <span class="origin">원산지-상세설명 참조</span>
                        </nav>
                        <img src="../img/vip_plcc_banner.png" alt="100원만 결제해도 1만원 적립!" class="banner">
                        
                        <div class="count">
                            <button class="decrease">-</button>
                            <input type="text" name="num" value="1" readonly />
                            <button class="increase">+</button>
                        </div>
                        
                        <div class="total">
                            <span><fmt:formatNumber value="${ product.price * (1-(product.discount/100)) }"  pattern="#,###" /></span>
                            <em>총 상품금액</em>
                        </div>

                        <div class="button">
                            <input type="button" class="cart" value="장바구니">
                            <input type="button" class="order" value="구매하기">
                        </div>
                    </div>
                </article>

                <!-- product detail -->
                <article class="detail">
                    <nav>
                        <h1>상품정보</h1>
                    </nav>
                    <img src="/Kmarket1/productImg/${ product.detail }" alt="상세페이지1">
                </article>

                <!-- product notice -->
                <article class="notice">
                    <nav>
                        <h1>상품 정보 제공 고시</h1>
                        <p>[전자상거래에 관한 상품정보 제공에 관한 고시] 항목에 의거 등록된 정보입니다.</p>
                    </nav>
                    <table border="0">
                        <tbody><tr>
                            <td>상품번호</td>
                            <td>${ product.cate1 }${ product.cate2 }<fmt:formatNumber type="number" pattern="###" minIntegerDigits="6" value="${ product.prodNo }" /></td>
                        </tr>
                        <tr>
                            <td>상품상태</td>
                            <td>새상품</td>
                        </tr>
                        <tr>
                            <td>부가세 면세여부</td>
                            <td>과세상품</td>
                        </tr>
                        <tr>
                            <td>영수증발행</td>
                            <td>발행가능 - 신용카드 전표, 온라인 현금영수증</td>
                        </tr>
                        <tr>
                            <td>사업자구분</td>
                            <td>사업자 판매자</td>
                        </tr>
                        <tr>
                            <td>브랜드</td>
                            <td>블루포스</td>
                        </tr>
                        <tr>
                            <td>원산지</td>
                            <td>국내생산</td>
                        </tr>
                    </tbody></table>
                    <table border="0">
                        <tbody><tr>
                            <td>제품소재</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>색상</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>치수</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>제조자/수입국</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>제조국</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>취급시 주의사항</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>제조연월</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>품질보증기준</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>A/S 책임자와 전화번호</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                            <td>주문후 예상 배송기간</td>
                            <td>상세정보 직접입력</td>
                        </tr>
                        <tr>
                        <td colspan="2">구매, 교환, 반품, 배송, 설치 등과 관련하여 추가비용, 제한조건 등의 특이사항이 있는 경우</td>
                        </tr>
                    </tbody></table>
                    <p class="notice">
                        소비자가 전자상거래등에서 소비자 보호에 관한 법률 제 17조 제1항 또는 제3항에 따라 청약철회를 하고
                        동법 제 18조 제1항 에 따라 청약철회한 물품을 판매자에게 반환하였음에도 불구 하고 결제 대금의
                        환급이 3영업일을 넘게 지연된 경우, 소비자 는 전자상거래등에서 소비자보호에 관한 법률 제18조
                        제2항 및 동법 시행령 제21조 2에 따라 지연일수에 대하여 전상법 시행령으로 정하는 이율을 곱하여
                        산정한 지연이자(“지연배상금”)를 신청할 수 있습니다. 아울러, 교환∙반품∙보증 및 결제대금의
                        환급신청은 [나의쇼핑정보]에서 하실 수 있으며, 자세한 문의는 개별 판매자에게 연락하여 주시기 바랍니다.
                    </p>
                </article>
                
                <!-- review -->
                <article class="review">
                    <nav>
                        <h1>상품리뷰</h1>
                    </nav>
                    <ul>
                    <c:forEach var="review" items="${ reviews }">
                        <li>
                            <div>
                                
                                <c:choose>
	                            	<c:when test="${ review.rating >= 4.5 }">
	                            		<h5 class="rating star5">상품평</h5>
	                            	</c:when>
	                            	<c:when test="${ review.rating >= 3.5 }">
	                            		<h5 class="rating star4">상품평</h5>
	                            	</c:when>
	                            	<c:when test="${ review.rating >= 2.5 }">
	                            		<h5 class="rating star3">상품평</h5>
	                            	</c:when>
	                            	<c:when test="${ review.rating >= 1.5 }">
	                            		<h5 class="rating star2">상품평</h5>
	                            	</c:when>
	                            	<c:when test="${ review.rating >= 0.5 }">
	                            		<h5 class="rating star1">상품평</h5>
	                            	</c:when>
	                            	<c:when test="${ review.rating < 0.5 }">
	                            		<h5 class="rating star0">상품평</h5>
	                            	</c:when>
	                            </c:choose>
                                <span>${fn:substring(review.uid, 0, 3)}<c:forEach begin="4" end="${fn:length(review.uid)}" step="1">*</c:forEach>
                                ${ review.rdate }
                                </span>
                            </div>
                            <h3>상품명 ${ product.prodName }</h3>
                            <p>${ review.content }</p>
                        </li>
                    </c:forEach>
                    </ul>
                    <!-- page number -->
	                <div class="paging">
						<c:if test="${pageGroupStart > 1}">
						<span class="prev">
			            	<a href="/Kmarket1/product/productView.do?cate1=${ cate1 }&cate2=${ cate2 }&prodNo=${ prodNo }&pg=${pageGroupStart - 1}">&lt; 이전</a>
			            </span>
			            </c:if>
			            <span class="num">
			            <c:forEach var="num" begin="${pageGroupStart}" end="${pageGroupEnd}">
			            	<a href="/Kmarket1/product/productView.do?cate1=${ cate1 }&cate2=${ cate2 }&prodNo=${ prodNo }&pg=${num}" class="${num == currentPage ? 'on':'off'}">${num}</a>
			            </c:forEach>
			            </span>
			            <c:if test="${pageGroupEnd < lastPageNum}">
			            <span class="next">
			            	<a href="/Kmarket1/product/productView.do?cate1=${ cate1 }&cate2=${ cate2 }&prodNo=${ prodNo }&pg=${pageGroupEnd + 1}" class="next">다음&nbsp;&gt;</a>
			            </span>
			            </c:if>
	                </div>
                </article>
                
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>