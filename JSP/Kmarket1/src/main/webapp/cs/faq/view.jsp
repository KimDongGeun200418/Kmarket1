<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<section id="cs">
    <div class="faq">
        <nav>
            <div>
                <p>홈<span>></span>자주묻는 질문</p>
            </div>
        </nav>
        <section class="view">
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
                    <h2 class="title">
                        <span>Q.</span>${article.title}
                    </h2>
                </nav>
                <div class="content">
                    <p>
                        ${article.content}   
                    </p>
                    <p>
                        ※피싱 관련 피해신고<br><br>
                        ▶ 경찰청 사이버수사국 (국번없이)182 : http://cyberbureau.police.go.kr<br>
                        ▶ KISA 인터넷침해대응센터 (국번없이)118 : http://www.krcert.or.kr<br>
                        감사합니다.<br>
                    </p>
                </div>
                <a href="/Kmarket/cs/faq/list.do?group=${group}&cate=${cate}" class="btnList">목록보기</a>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>