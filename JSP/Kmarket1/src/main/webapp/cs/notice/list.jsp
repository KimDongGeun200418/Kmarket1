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
                    <li class="${cate == null ? 'on':'off' }"><a href="/cs/list.do?group=notice">전체</a></li>
                    <li class="${cate eq 'service' ? 'on':'off' }"><a href="/cs/list.do?group=notice&cate=1">고객서비스</a></li>
                    <li class="${cate eq 'safety' ? 'on':'off' }"><a href="/cs/list.do?group=notice&cate=2">안전거래</a></li>
                    <li class="${cate eq 'product' ? 'on':'off' }"><a href="/cs/list.do?group=notice&cate=3">위해상품</a></li>
                    <li class="${cate eq 'event' ? 'on':'off' }"><a href="/cs/list.do?group=notice&cate=4">이벤트당첨</a></li>
                </ul>
            </aside>
            <article>
                <nav>
                    <c:if test="${cate == null}"><h1>전체</h1><h2>공지사항 전체</h2></c:if>
                    <c:if test="${cate eq 'service'}"><h1>고객서비스</h1><h2>공지사항 고객서비스</h2></c:if>
                    <c:if test="${cate eq 'safety'}"><h1>안전거래</h1><h2>공지사항 안전거래</h2></c:if>
                    <c:if test="${cate eq 'product'}"><h1>위해상품</h1><h2>공지사항 위해상품</h2></c:if>
                    <c:if test="${cate eq 'event'}"><h1>이벤트당첨</h1><h2>공지사항 이벤트당첨</h2></c:if>
                    <h2>내용입니다.</h2>
                </nav>
                <table>
                	<c:forEach var="article" items="${articles}">
                    <tr>
                        <td>
                            <a href="/cs/view.do?group=notice$cate=${cate}">${article.title}</a>
                        </td>
                        <td>${article.rdate.substring(2, 10)}</td>
                    </tr>
                    </c:forEach>
                </table>
                <div class="page">
                    <a href="#" class="prev">이전</a>
                    <a href="#" class="num on">1</a>
                    <a href="#" class="num">2</a>
                    <a href="#" class="num">3</a>
                    <a href="#" class="next">다음</a>
                </div>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>