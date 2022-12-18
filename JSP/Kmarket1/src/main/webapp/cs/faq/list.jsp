<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<section id="cs">
    <div class="faq">
        <nav>
            <div>
                <p>
                	홈<span>></span>
                	<c:if test="${group eq 'notice'}">공지사항</c:if>
                	<c:if test="${group eq 'faq'}">자주묻는 질문</c:if>
                	<c:if test="${group eq 'qna'}">문의사항</c:if>
                </p>
            </div>
        </nav>
        <section class="list">
            <aside>
                <h2>자주묻는 질문</h2>
                <ul>
                    <li class="${cate eq 'member' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=member">회원</a></li>
                    <li class="${cate eq 'coupon' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=coupon">쿠폰/이벤트</a></li>
                    <li class="${cate eq 'order' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=order">주문/결제</a></li>
                    <li class="${cate eq 'delivery' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=delivery">배송</a></li>
                    <li class="${cate eq 'cancel' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=cancel">취소/반폼/교환</a></li>
                    <li class="${cate eq 'trip' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=trip">여행/숙박/항공</a></li>
                    <li class="${cate eq 'safety' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=safety">안전거래</a></li>
                </ul>
            </aside>
            <article>
                <nav>
                    <c:if test="${cate eq 'member'}"><h1>회원</h1><h2>회원관련 자주 묻는 질문입니다.</h2></c:if>
                    <c:if test="${cate eq 'coupon'}"><h1>쿠폰/이벤트</h1><h2>쿠폰/이벤트관련 자주 묻는 질문입니다.</h2></c:if>
                    <c:if test="${cate eq 'order'}"><h1>주문/결제</h1><h2>주문/결제관련 자주 묻는 질문입니다.</h2></c:if>
                    <c:if test="${cate eq 'delivery'}"><h1>배송</h1><h2>배송관련 자주 묻는 질문입니다.</h2></c:if>
                    <c:if test="${cate eq 'cancel'}"><h1>취소/반품/교환</h1><h2>취소/반품/교환관련 자주 묻는 질문입니다.</h2></c:if>
                    <c:if test="${cate eq 'trip'}"><h1>여행/숙박/항공</h1><h2>여행/숙박/항공관련 자주 묻는 질문입니다.</h2></c:if>
                    <c:if test="${cate eq 'safety'}"><h1>안전거래</h1><h2>안전거래관련 자주 묻는 질문입니다.</h2></c:if>
                </nav>
                <div>
                	<c:forEach var="ct" items="${category}">
                		<h3>${ct.cate2}</h3>
                		<c:set var="ct.cate2" value="${ct.cate2}"/>
	                    <c:forEach var="article" items="${articles}">
	                    	<c:if test="${article.cate2 eq ct.cate2}">
		                    <ul>
		                        <li><a href="./view.do?group=faq&cate=${cate}&cate2=${article.cate2}&no=${article.no}"><span>Q.</span>${article.title}</a></li>
		                    </ul>
		                    </c:if>
                    	</c:forEach>
                    	<ul><li class="more"><a href="#">더보기</a></li></ul>
                    </c:forEach>
                </div>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>