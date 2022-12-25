<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<section id="cs">
    <div class="notice">
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
                <h2>공지사항</h2>
                <ul>
                    <li class="${cate == null ? 'on':'off' }"><a href="/Kmarket1/cs/notice/list.do?group=notice">전체</a></li>
                    <li class="${cate eq '고객서비스' ? 'on':'off' }"><a href="/Kmarket1/cs/notice/list.do?group=notice&cate=고객서비스">고객서비스</a></li>
                    <li class="${cate eq '안전거래' ? 'on':'off' }"><a href="/Kmarket1/cs/notice/list.do?group=notice&cate=안전거래">안전거래</a></li>
                    <li class="${cate eq '위해상품' ? 'on':'off' }"><a href="/Kmarket1/cs/notice/list.do?group=notice&cate=위해상품">위해상품</a></li>
                    <li class="${cate eq '이벤트당첨' ? 'on':'off' }"><a href="/Kmarket1/cs/notice/list.do?group=notice&cate=이벤트당첨">이벤트당첨</a></li>
                </ul>
            </aside>
            <article>
                <nav>
                    <c:if test="${cate == null || cate eq ''}"><h1>전체</h1><h2>공지사항 전체내용입니다.</h2></c:if>
                    <c:if test="${cate eq '고객서비스'}"><h1>고객서비스</h1><h2>공지사항 고객서비스내용입니다.</h2></c:if>
                    <c:if test="${cate eq '안전거래'}"><h1>안전거래</h1><h2>공지사항 안전거래내용입니다.</h2></c:if>
                    <c:if test="${cate eq '위해상품'}"><h1>위해상품</h1><h2>공지사항 위해상품내용입니다.</h2></c:if>
                    <c:if test="${cate eq '이벤트당첨'}"><h1>이벤트당첨</h1><h2>공지사항 이벤트당첨내용입니다.</h2></c:if>
                </nav>
                <table>
                	<c:forEach var="article" items="${articles}">
                    <tr>
                        <td>
                            <a href="./view.do?group=notice&cate=${cate}&pg=${currentPage}&no=${article.no}">${article.title}</a>
                        </td>
                        <td>${article.rdate.substring(2, 10)}</td>
                    </tr>
                    </c:forEach>
                </table>
                <div class="page">
                	<c:if test="${pageGroupStart > 1}">
                    <a href="/Kmarket1/cs/notice/list.do?group=notice&cate=${cate}&pg=${pageGroupStart - 1}" class="prev">이전</a>
                    </c:if>
                    <c:forEach var="num" begin="${pageGroupStart}" end="${pageGroupEnd}">
                    <a href="/Kmarket1/cs/notice/list.do?group=notice&cate=${cate}&pg=${num}" class="num ${num == currentPage ? 'current':'off' }">${num}</a>
                    </c:forEach>
                    <c:if test="${pageGroupEnd < lastPageNum}">
                    <a href="/Kmarket1/cs/notice/list.do?group=notice&cate=${cate}&pg=${pageGroupEnd + 1}" class="next">다음</a>
                    </c:if>
                </div>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>