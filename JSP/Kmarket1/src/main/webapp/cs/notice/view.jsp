<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <li class="${cate eq 'service' ? 'on':'off' }"><a href="/Kmarket1/cs/notice/list.do?group=notice&cate=service">고객서비스</a></li>
                    <li class="${cate eq 'safety' ? 'on':'off' }"><a href="/Kmarket1/cs/notice/list.do?group=notice&cate=safety">안전거래</a></li>
                    <li class="${cate eq 'product' ? 'on':'off' }"><a href="/Kmarket1/cs/notice/list.do?group=notice&cate=product">위해상품</a></li>
                    <li class="${cate eq 'event' ? 'on':'off' }"><a href="/Kmarket1/cs/notice/list.do?group=notice&cate=event">이벤트당첨</a></li>
                </ul>
            </aside>
            <article>
                <nav>
                    <h2 class="title">${article.title}</h2>
                    <span class="date">${article.rdate.substring(0, 10)}</span>
                </nav>
                <div class="content">${article.content}</div>
                <a href="/Kmarket1/cs/notice/list.do?group=notice&cate=${cate}&pg=${pg}" class="btnList">목록보기</a>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>