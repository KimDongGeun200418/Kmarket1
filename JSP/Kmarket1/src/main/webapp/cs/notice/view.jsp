<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<section id="cs">
    <div class="notice">
        <nav>
            <div>
                <p>홈<span>></span>공지사항</p>
            </div>
        </nav>
        <section class="view">
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
            	<div class="explain">
            		<c:choose>
            			<c:when test="${cate == null || cate eq ''}"><h1>전체</h1><h2>공지사항 전체내용입니다.</h2></c:when>
            			<c:otherwise><h1>${cate}</h1><h2>공지사항 ${cate}내용입니다.</h2></c:otherwise>
            		</c:choose>
                </div>
                <nav>
                    <h2 class="title">${article.title}</h2>
                    <span class="date">${article.rdate.substring(0, 10)}</span>
                </nav>
                <div class="content">
                	<p>${article.content}</p><br><br>
                    <p>
                        ※피싱 관련 피해신고<br><br>
                        ▶ 경찰청 사이버수사국 (국번없이)182 : http://cyberbureau.police.go.kr<br>
                        ▶ KISA 인터넷침해대응센터 (국번없이)118 : http://www.krcert.or.kr<br>
                        감사합니다.<br>
                    </p>
                </div>
                <a href="/Kmarket1/cs/notice/list.do?group=notice&cate=${cate}&pg=${pg}" class="btnList">목록</a>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>