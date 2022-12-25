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
            	<div class="explain">
           			<h1>${cate}</h1><h2>${cate}관련 자주묻는 질문입니다.</h2>
                </div>
                <nav>
                    <h2 class="title">
                        <span>Q.</span>${article.title}
                    </h2>
                </nav>
                <div class="content">
                    <p>
                        ${article.content}   
                    </p><br><br>
                    <p>
                        ※피싱 관련 피해신고<br><br>
                        ▶ 경찰청 사이버수사국 (국번없이)182 : http://cyberbureau.police.go.kr<br>
                        ▶ KISA 인터넷침해대응센터 (국번없이)118 : http://www.krcert.or.kr<br>
                        감사합니다.<br>
                    </p>
                </div>
                <a href="/Kmarket1/cs/faq/list.do?group=${group}&cate=${cate}" class="btnList">목록</a>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>