<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
            <section id="admin-notice-write">
                <nav>
                    <h3>공지사항 작성</h3>
                    <p>
                        HOME > 고객센터 > <strong>공지사항</strong>
                    </p>
                </nav>
                <article class="list">
                	<form action="./noticeWrite.do" method="post">
	                   <input type="hidden" name="group" value="${group}"/>
	        		   <input type="hidden" name="uid" value="${uid}"/>
		               <table>
		               	<tr>
		               		<th>유형</th>
		               		<td>
		               			<select name="type">
	                                    <option value="0">유형 선택</option>
	                                    <option value="member">회원</option>
	                                    <option value="coupon">쿠폰/이벤트</option>
	                                    <option value="order">주문/결제</option>
	                                    <option value="delivery">배송</option>
	                                    <option value="cancel">취소/반품/교환</option>
	                                    <option value="trip">여행/숙박/항공</option>
	                                    <option value="safety">안전거래</option>
	                            </select>
		               		</td>
		               	</tr>
		               	<tr>
		               		<th>제목</th>
		               		<td><input type="text" name="title" placeholder="제목을 입력합니다."></td>
		               	</tr>
		               	<tr>
		               		<th>내용</th>
		               		<td><textarea name="content" placeholder="내용을 입력하세요."></textarea></td>
		               	</tr>
		               </table>
	                   <div>
	                        <a href="/Kmarket1/admin/cs/noticeList.do?group=${group}&cate=${cate}" class="btnList">취소하기</a>
	                        <input type="submit" class="btnSubmit" value="등록하기">
	                   </div>
	            	</form>
	        	</article>        
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>