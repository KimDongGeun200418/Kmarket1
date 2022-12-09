<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
	</dib></dib></header>
        <main id="member">
            <div class="signup">
                <nav>
                    <h1>약관</h1>
                </nav>
                <section>
                    <h3>
                        <span class="essential">(필수)</span>케이마켓 이용약관
                    </h3>
                    <textarea class="terms" readonly> ${ terms.terms } </textarea>
                    <label>
                        <input type="checkbox" name="agree1">동의합니다.
                    </label>                   
                    <h3>
                        <span class="essential">(필수)</span>전자금융거래약관 이용약관
                    </h3>
                    <textarea class="financial" readonly> ${ terms.finance } </textarea>
                    <label>
                        <input type="checkbox" name="agree2">동의합니다.
                    </label>                   
                    <h3>
                        <span class="essential">(필수)</span>개인정보 수집동의
                    </h3>
                    <textarea class="privacy" readonly> ${ terms.privacy } </textarea>
                    <label>
                        <input type="checkbox" name="agree3">동의합니다.
                    </label>                   
                </section>
                <section>
                    <h3>
                        <span class="optional">(선택)</span>위치정보 이용약관
                    </h3>
                    <textarea class="location" readonly> ${ terms.location } </textarea>
                    <label>
                        <input type="checkbox" name="agree4">동의합니다.
                    </label>
                </section>
                    <div>
                        <input type="button" class="agree" value="동의하기">
                    </div>
            </div>
        </main>
<jsp:include page="../_footer.jsp"/>