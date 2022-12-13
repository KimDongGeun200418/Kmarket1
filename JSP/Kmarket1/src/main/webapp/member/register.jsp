<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Kmarket1/member/js/register.js"></script>
<script src="/Kmarket1/member/js/postcode.js"></script>
	</dib></dib></header>
        <main id="member">
            <div class="register">
                <nav>
                    <h1>일반 회원가입</h1>
                </nav>
                <form action="/Kmarket1/member/register.do" method="POST">
                	<input type="hidden" name="type" value="${ type }"/>
                	<input type="hidden" name="provLocation" value="${ provLocation }"/>
                    <section>
                        <table>
                            <caption>필수 정보입력</caption>
                            <tr>
                                <th><span class="essential">*</span>아이디</th>
                                <td>
                                    <input type="text" name="km_uid" placeholder="아이디 입력" required>
                                    <button type="button" class="btnCheck" id="btnCheckUid">중복확인</button>
                                    <span class="uidResult">영문, 숫자로 4~12자까지 설정해주세요.</span>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="essential">*</span>비밀번호</th>
                                <td>
                                    <input type="password" name="km_pass1" class="checkPass" placeholder="비밀번호 입력" required>
                                    <span class="passResult">영문, 숫자, 특수문자를 조합하여 8~12자까지 설정해주세요.</span>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="essential">*</span>비밀번호 확인</th>
                                <td>
                                    <input type="password" name="km_pass2" class="checkPass" placeholder="비밀번호 확인" required>
                                </td>
                            </tr>
                        </table>
                    </section>
                    <section>
                        <table>
                            <caption>기본 정보입력</caption>
                            <tr>
                                <th>
                                    <span class="essential">*</span>이름
                                </th>
                                <td>
                                    <input type="text" name="km_name" placeholder="이름 입력" required>
                                    <span class="nameResult"></span>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>성별
                                </th>
                                <td>
                                    <label>
                                        <input type="radio" name="km_gender" value="1" checked>&nbsp;남
                                    </label>
                                    <label>
                                        <input type="radio" name="km_gender" value="2" checked>&nbsp;여
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>EMAIL
                                </th>
                                <td>
                                	<div class="mailFirst">
	                                    <input type="email" name="km_email" placeholder="이메일 입력" required>
	                                    <button type="button" class="btnCheck" id="btnSendEmail">메일인증</button>
                                    </div>
                                    <div class="mailSecond" style="display:none;">
			                            <input type="text" name="km_email_code" placeholder="인증번호 입력"/>
			                            <button type="button" class="btnCheck" id="btnCheckEmail">확인</button>
			                        </div>
			                        <span class="emailResult"></span>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="essential">*</span>휴대폰
                                </th>
                                <td>
                                    <input type="text" name="km_hp" maxlength="13" placeholder="휴대폰번호 입력" required>
                                    <span class="hpResult">- 포함 13자리를 입력하세요.</span>
                                </td>
                            </tr>
                            <tr class="addr">
                                <th>주소</th>
                                <td>
                                    <div><input type="text" name="km_zip" id="km_zip" placeholder="클릭하여 주소 검색" readonly></div>
                                    <div><input type="text" name="km_addr1" id="km_addr1" placeholder="주소를 검색하세요" readonly></div>
                                    <div><input type="text" name="km_addr2" id="km_addr2" placeholder="상세주소를 입력하세요"></div>
                                </td>
                            </tr>
                        </table>
                    </section>
                    <div>
                        <input type="submit" class="join" value="회원가입">
                    </div>
                </form>
                <img src="/Kmarket1/member/img/member_certifi_logo.gif" alt="banner">
            </div>
        </main>
<jsp:include page="../_footer.jsp"/>