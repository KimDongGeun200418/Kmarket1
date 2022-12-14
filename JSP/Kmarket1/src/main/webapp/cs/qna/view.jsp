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
                    <li class="${cate eq 'member' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=member">회원</a></li>
                    <li class="${cate eq 'coupon' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=coupon">쿠폰/이벤트</a></li>
                    <li class="${cate eq 'order' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=order">주문/결제</a></li>
                    <li class="${cate eq 'delivery' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=delivery">배송</a></li>
                    <li class="${cate eq 'cancel' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=cancel">취소/반폼/교환</a></li>
                    <li class="${cate eq 'trip' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=trip">여행/숙박/항공</a></li>
                    <li class="${cate eq 'safety' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=safety">안전거래</a></li>
                </ul>
            </aside>
            <article>
                <nav>
                   	<c:if test="${article.cate2 eq 'a'}"><h2 class="title">[탈퇴]${article.title}</h2></c:if>
                   	<c:if test="${article.cate2 eq 'b'}"><h2 class="title">[회원정보]${article.title}</h2></c:if>
                   	<c:if test="${article.cate2 eq 'c'}"><h2 class="title">[로그인]${article.title}</h2></c:if>
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
                    <p>
                        ※피싱 관련 피해신고<br><br>
                        ▶ 경찰청 사이버수사국 (국번없이)182 : http://cyberbureau.police.go.kr<br>
                        ▶ KISA 인터넷침해대응센터 (국번없이)118 : http://www.krcert.or.kr<br>
                        감사합니다.<br>
                    </p>
                </div>
                <!-- 답변 -->
                <div class="comment">
                	<h2>[답변]${article.title}</h2>
                	<p class="content">답변내용</p>
                </div>
                <a href="/Kmarket1/cs/qna/list.do?group=qna&cate=${cate}&pg=${pg}" class="btnList">목록보기</a>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>