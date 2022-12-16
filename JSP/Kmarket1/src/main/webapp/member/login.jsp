<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
	</dib></dib></header>
<%
	String success = request.getParameter("success");
	String uid = request.getParameter("uid");
%>
<script>
	let success = <%= success %>
	if (success == '100'){
		alert('아이디/비밀번호가 틀렸습니다.');
	} else if(success == '201'){
		alert('로그아웃 되었습니다.');
	}
</script>
        <main id="member">
            <div class="login">
                <nav>
                    <h1>로그인</h1>
                    <p>HOME > <strong>로그인</strong></p>
                </nav>
                <form action="/Kmarket1/member/login.do" method="POST">
                    <table border="0">
                        <tr>
                            <td>아이디</td>
                            <td><input type="text" name="uid" value="${ uid }" placeholder="아이디 입력"></td>
                        </tr>
                        <tr>
                            <td>비밀번호	</td>
                            <td><input type="password" name="pass" placeholder="비밀번호 입력"></td>
                        </tr>
                    </table>
                    <input type="submit" value="로그인">
                    <span>
                        <label>
                            <input type="checkbox" name="auto">자동로그인
                        </label>
                        <a href="#">아이디찾기</a>
                        <a href="#">비밀번호찾기</a>
                        <a href="/Kmarket1/member/join.do">회원가입</a>
                    </span>
                    <a href="#" class="banner"><img src="/Kmarket1/member/img/member_login_banner.jpg" alt="1만원 할인 쿠폰 받기"></a>
                </form>
                <img src="/Kmarket1/member/img/member_certifi_logo.gif" alt="banner">
            </div>
        </main>
<jsp:include page="../_footer.jsp"/>