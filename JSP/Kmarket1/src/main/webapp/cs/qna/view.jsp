<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../_header.jsp"/>
<section id="cs">
    <div class="qna">
        <nav>
            <div>
                <p>홈<span>></span>문의하기</p>
            </div>
        </nav>
        <section class="view">
            <aside>
                <h2>문의하기</h2>
                <ul>
                    <li class="${cate eq '회원' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=회원">회원</a></li>
                    <li class="${cate eq '쿠폰/혜택/이벤트' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=쿠폰/혜택/이벤트">쿠폰/혜택/이벤트</a></li>
                    <li class="${cate eq '주문/결제' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=주문/결제">주문/결제</a></li>
                    <li class="${cate eq '배송' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=배송">배송</a></li>
                    <li class="${cate eq '취소/반품/교환' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=취소/반품/교환">취소/반품/교환</a></li>
                    <li class="${cate eq '여행/숙박/항공' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=여행/숙박/항공">여행/숙박/항공</a></li>
                    <li class="${cate eq '안전거래' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=안전거래">안전거래</a></li>
                </ul>
            </aside>
            <article>
                <nav>
                   	<h2 class="title">[${article.cate2}]${article.title}</h2>
                    <p>
                        <span>
                        	${fn:substring(article.uid,0,3)}
                        	<c:forEach begin="4" end="${fn:length(article.uid) }" step="1">
                        	*
                        	</c:forEach>
                        </span>
                        <span>${article.rdate.substring(0, 10)}</span>
                    </p>
                </nav>
                <div class="content">
                    <p>${article.content}</p>
                </div>
                <!-- 답변 -->
                <c:choose>
                	<c:when test="${article.comment != null}">
                		<div class="comment">
		                	<h2 class="title">▶ [답변]${article.title}</h2>
		                	<p class="content">${article.comment}</p>
                		</div>
                	</c:when>
                	<c:otherwise></c:otherwise>
                </c:choose>
                <a href="/Kmarket1/cs/qna/list.do?group=qna&cate=${cate}&pg=${pg}" class="btnList">목록보기</a>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>