<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	function optionChange(){
		var c1 = ['탈퇴','회원정보','로그인'];
		var c2 = ['a','b','c'];
		var c3 = ['d','e','f'];
		var c4 = ['g','h','q'];
		var c5 = ['w','e','r'];
		var c6 = ['t','y','u'];
		var c7 = ['a','a','a'];
		var v = $('#list1').val();
		var opt;
	
		if(v == 'member'){
			opt = c1;
		}else if(v == 'coupon'){
			opt = c2;
		}else if(v == 'order'){
			opt = c3;
		}else if(v == 'delivery'){
			opt = c4;
		}else if(v == 'cancel'){
			opt = c5;
		}else if(v == 'trip'){
			opt = c6;
		}else if(v == 'safety'){
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
<section id="cs">
    <div class="qna">
        <nav>
            <div>
                <p>홈<span>></span>문의하기</p>
            </div>
        </nav>
        <section class="write">
            <aside>
                <h2>문의하기</h2>
                <ul>
                    <li class="${cate eq 'member' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=member">회원</a></li>
                    <li class="${cate eq 'coupon' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=coupon">쿠폰/이벤트</a></li>
                    <li class="${cate eq 'order' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=order">주문/결제</a></li>
                    <li class="${cate eq 'delivery' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=delivery">배송</a></li>
                    <li class="${cate eq 'cancel' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=cancel">취소/반품/교환</a></li>
                    <li class="${cate eq 'trip' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=trip">여행/숙박/항공</a></li>
                    <li class="${cate eq 'safety' ? 'on':'off' }"><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=safety">안전거래</a></li>
                </ul>
            </aside>
            <article>
                <form action="./write.do" method="post">
                	<input type="hidden" name="group" value="${group}"/>
        			<input type="hidden" name="uid" value="${uid}"/>
                    <table>
                        <tr>
                            <td>문의유형</td>
                            <td>
                                <select name="type1" id="list1" onChange="optionChange();">
                                    <option value="0">1차 선택</option>
                                    <option value="member">회원</option>
                                    <option value="coupon">쿠폰/이벤트</option>
                                    <option value="order">주문/결제</option>
                                    <option value="delivery">배송</option>
                                    <option value="cancel">취소/반품/교환</option>
                                    <option value="trip">여행/숙박/항공</option>
                                    <option value="safety">안전거래</option>
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
                        <a href="/Kmarket1/cs/qna/list.do?group=${group}&cate=${cate}" class="btnList">취소하기</a>
                        <input type="submit" class="btnSubmit" value="등록하기">
                    </div>
                </form>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>