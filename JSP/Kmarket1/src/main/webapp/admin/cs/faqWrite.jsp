<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	function optionChange(){
		var c1 = ['탈퇴','회원정보','로그인','가입'];
		var c2 = ['쿠폰/할인혜택','포인트','제휴','이벤트'];
		var c3 = ['상품','결제','구매내역','영수증/증빙'];
		var c4 = ['배송상태/기간','배송정보확인/변경','해외배송','당일배송','해외직구'];
		var c5 = ['반품신청/철회','반품정보확인/변경','교환 AS신청/철회','교환정보확인/변경','취소신청/철회','취소확인/환불정보'];
		var c6 = ['여행/숙박','항공'];
		var c7 = ['서비스 이용규칙 위반','지식재산권침해','법령 및 정책위반 상품','게시물 정책위반','직거래/외부거래유도','표시광고','청소년 위해상품/이미지'];
		var v = $('#list1').val();
		var opt;
	
		if(v == '회원'){
			opt = c1;
		}else if(v == '쿠폰/혜택/이벤트'){
			opt = c2;
		}else if(v == '주문/결제'){
			opt = c3;
		}else if(v == '배송'){
			opt = c4;
		}else if(v == '취소/반품/교환'){
			opt = c5;
		}else if(v == '여행/숙박/항공'){
			opt = c6;
		}else if(v == '안전거래'){
			opt = c7;
		}
		
		$('#list2').empty();
		$( '#list2' ).append( '<option>2차 선택</option>' );
		
		for(var i = 0; i < opt.length; i++){
			$('#list2').append('<option>'+opt[i]+'</option>');
		}
	}
	
</script>
<jsp:include page="../_header.jsp"/>
            <section id="admin-faq-write">
                <nav>
                    <h3>공지사항 작성</h3>
                    <p>
                        HOME > 고객센터 > <strong>공지사항</strong>
                    </p>
                </nav>
                <article class="list">
                	<form action="./faqWrite.do" method="post">
	                   <input type="hidden" name="group" value="${group}"/>
	        			<input type="hidden" name="uid" value="${uid}"/>
	                    <table>
	                        <tr>
	                            <td>문의유형</td>
	                            <td>
	                                <select name="type1" id="list1" onChange="optionChange();">
	                                    <option value="0">1차 선택</option>
	                                    <option value="회원">회원</option>
	                                    <option value="쿠폰/혜택/이벤트">쿠폰/혜택/이벤트</option>
	                                    <option value="주문/결제">주문/결제</option>
	                                    <option value="배송">배송</option>
	                                    <option value="취소/반품/교환">취소/반품/교환</option>
	                                    <option value="여행/숙박/항공">여행/숙박/항공</option>
	                                    <option value="안전거래">안전거래</option>
	                                </select>
	                                <select name="type2" id="list2">
	                                	<option value="0">2차 선택</option>
	                                </select>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>문의제목</td>
	                            <td>
	                                <input type="text" name="title" placeholder="제목을 입력하세요.">
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>문의내용</td>
	                            <td>
	                                <textarea name="content" placeholder="내용을 입력하세요."></textarea>
	                            </td>
	                        </tr>
	                    </table>
	                   <div>
	                        <a href="/Kmarket1/admin/cs/faqList.do?group=${group} class="btnList">취소하기</a>
	                        <input type="submit" class="btnSubmit" value="등록하기">
	                   </div>
	            	</form>
	        	</article>        
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>