<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$('ul.article li:nth-child(n+4)').hide();
		$('.more').click(function(){
			let more = $(this).text();
			
			if(more == '더보기'){
				$(this).text('간단히 보기');
				$(this).parent().children('li:hidden').slideDown(200);
			}else{
				$(this).text('더보기');
				$(this).parent().children('li:nth-child(n+4)').slideUp(200);
			}
			
		});
	});
</script>
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
                    <li class="${cate eq '회원' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=회원">회원</a></li>
                    <li class="${cate eq '쿠폰/혜택/이벤트' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=쿠폰/혜택/이벤트">쿠폰/혜택/이벤트</a></li>
                    <li class="${cate eq '주문/결제' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=주문/결제">주문/결제</a></li>
                    <li class="${cate eq '배송' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=배송">배송</a></li>
                    <li class="${cate eq '취소/반품/교환' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=취소/반품/교환">취소/반폼/교환</a></li>
                    <li class="${cate eq '여행/숙박/항공' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=여행/숙박/항공">여행/숙박/항공</a></li>
                    <li class="${cate eq '안전거래' ? 'on':'off' }"><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=안전거래">안전거래</a></li>
                </ul>
            </aside>
            <article>
                <nav>
                    <c:if test="${cate eq '회원'}"><h1>회원</h1><h2>회원관련 자주 묻는 질문입니다.</h2></c:if>
                    <c:if test="${cate eq '쿠폰/혜택/이벤트'}"><h1>쿠폰/혜택/이벤트</h1><h2>쿠폰/혜택/이벤트관련 자주 묻는 질문입니다.</h2></c:if>
                    <c:if test="${cate eq '주문/결제'}"><h1>주문/결제</h1><h2>주문/결제관련 자주 묻는 질문입니다.</h2></c:if>
                    <c:if test="${cate eq '배송'}"><h1>배송</h1><h2>배송관련 자주 묻는 질문입니다.</h2></c:if>
                    <c:if test="${cate eq '취소/반품/교환'}"><h1>취소/반품/교환</h1><h2>취소/반품/교환관련 자주 묻는 질문입니다.</h2></c:if>
                    <c:if test="${cate eq '여행/숙박/항공'}"><h1>여행/숙박/항공</h1><h2>여행/숙박/항공관련 자주 묻는 질문입니다.</h2></c:if>
                    <c:if test="${cate eq '안전거래'}"><h1>안전거래</h1><h2>안전거래관련 자주 묻는 질문입니다.</h2></c:if>
                </nav>
                <div>
                	<c:forEach var="ct" items="${category}">
                		<h3>${ct.cate2}</h3>
                		<c:set var="ct.cate2" value="${ct.cate2}"/>
                		<ul class="article">
		                    <c:forEach var="article" items="${articles}">
		                    	<c:if test="${article.cate2 eq ct.cate2}">
			                        <li id="moreContent"><a href="./view.do?group=faq&cate=${cate}&cate2=${article.cate2}&no=${article.no}"><span>Q.</span>${article.title}</a></li>
			                    </c:if>
                   	        </c:forEach>
                   	        <c:choose>
                   	        	<c:when test="${fn:length(articles) > 3}">
                   	        		<li class="more">더보기</li>
                   	        	</c:when>
                   	        	<c:otherwise></c:otherwise>
                   	        </c:choose>
                    	</ul>
                    </c:forEach>
                </div>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>