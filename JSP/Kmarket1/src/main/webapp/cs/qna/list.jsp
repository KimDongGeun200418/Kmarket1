<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../_header.jsp"/>
<section id="cs">
    <div class="qna">
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
                	<c:if test="${cate eq '회원'}"><h1>회원</h1><h2>회원 관련 문의내용입니다.</h2></c:if>
                    <c:if test="${cate eq '쿠폰/혜택/이벤트'}"><h1>쿠폰/혜택/이벤트</h1><h2>쿠폰/이벤트 관련 문의내용입니다.</h2></c:if>
                    <c:if test="${cate eq '주문/결제'}"><h1>주문/결제</h1><h2>주문/결제 관련 문의내용입니다.</h2></c:if>
                    <c:if test="${cate eq '배송'}"><h1>배송</h1><h2>배송 관련 문의내용입니다.</h2></c:if>
                    <c:if test="${cate eq '취소/반품/교환'}"><h1>취소/반품/교환</h1><h2>취소/반품/교환 관련 문의내용입니다.</h2></c:if>
                </nav>
                <table>
                	<c:forEach var="article" items="${articles}">
                	<tr>
                        <td>
                            <a href="./view.do?group=qna&cate=${cate}&pg=${currentPage}&no=${article.no}">
                            	[${article.cate2}]${article.title}
                            </a>
                        </td>
                        <td>
                        	<c:if test="${article.comment == null}"><span style="color:#cecbcb; font-weight:bold">검토중</span></c:if>
                        	<c:if test="${article.comment != null}"><span style="color:#2da9e9; font-weight:bold">답변완료</span></c:if>
                        </td>
                        <td>
                        	${fn:substring(article.uid,0,3)}
                        	<c:forEach begin="4" end="${fn:length(article.uid) }" step="1">
                        	*
                        	</c:forEach>
                        </td>
                        <td>${article.rdate.substring(2, 10)}</td>
                    </tr>
                    </c:forEach>
                </table>
                <div class="page">
                	<c:if test="${pageGroupStart > 1}">
                    <a href="/Kmarket1/cs/qna/list.do?group=qna&cate=${cate}&pg=${pageGroupStart - 1}" class="prev">이전</a>
                    </c:if>
                    <c:forEach var="num" begin="${pageGroupStart}" end="${pageGroupEnd}">
                    <a href="/Kmarket1/cs/qna/list.do?group=qna&cate=${cate}&pg=${num}" class="num ${num == currentPage ? 'current':'off' }">${num}</a>
                    </c:forEach>
                    <c:if test="${pageGroupEnd < lastPageNum}">
                    <a href="/Kmarket1/cs/qna/list.do?group=qna&cate=${cate}&pg=${pageGroupEnd + 1}" class="next">다음</a>
                    </c:if>
                </div>
                <a href="./write.do?group=qna&cate=${cate}" class="btnWrite">문의하기</a>         
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>