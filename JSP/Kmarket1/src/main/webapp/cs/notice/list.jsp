<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<section id="cs">
    <div class="notice">
        <nav>
            <div>
                <p>
                	홈<span>></span>
					자주묻는 질문
                </p>
            </div>
        </nav>
        <section class="list">
            <aside>
                <h2>공지사항</h2>
                <ul>
                    <li class="on">
                        <a href="/cs/list.do?cate=${cate}">전체</a>
                    </li>
                    <li>
                        <a href="#">고객서비스</a>
                    </li>
                    <li>
                        <a href="#">안전거래</a>
                    </li>
                    <li>
                        <a href="#">위해상품</a>
                    </li>
                    <li>
                        <a href="#">이벤트당첨</a>
                    </li>
                </ul>
            </aside>
            <article>
                <nav>
                    <h1>전체</h1>
                    <h2>공지사항 전체 내용입니다.</h2>
                </nav>
                <table>
                    <tr>
                        <td>
                            <a href="/cs/view.do?cate=${cate}">제목</a>
                        </td>
                        <td>2022.11.21</td>
                    </tr>
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