<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
            <section id="admin-notice-write">
                <nav>
                    <h3>공지사항 수정</h3>
                    <p>
                        HOME > 고객센터 > <strong>공지사항</strong>
                    </p>
                </nav>
                <article class="list">
                	<form action="./noticeModify.do" method="post">
	                   <input type="hidden" name="group" value="${group}"/>
	                   <input type="hidden" name="pg" value="${pg}"/>
	                   <input type="hidden" name="no" value="${no}"/>
	        		   <input type="hidden" name="uid" value="${uid}"/>
		               <table>
		               	<tr>
		               		<th>유형</th>
		               		<td>
		               			<select name="type">
	                                    <option value="고객서비스" <c:if test="${cate} == 고객서비스">selected</c:if>>고객서비스</option>
	                                    <option value="안전거래" <c:if test="${cate} == 안전거래">selected</c:if>>안전거래</option>
	                                    <option value="위해상품" <c:if test="${cate} == 위해상품">selected</c:if>>위해상품</option>
	                                    <option value="이벤트당첨" <c:if test="${cate} == 이벤트당첨">selected</c:if>>이벤트당첨</option>
	                            </select>
		               		</td>
		               	</tr>
		               	<tr>
		               		<th>제목</th>
		               		<td><input type="text" name="title" value="${article.title}"></td>
		               	</tr>
		               	<tr>
		               		<th>내용</th>
		               		<td><textarea name="content" >${article.content}</textarea></td>
		               	</tr>
		               </table>
	                   <div>
	                        <a href="/Kmarket1/admin/cs/noticeView.do?group=${group}&cate=${cate}&no=${no}&pg=${pg}" class="btnCancel">취소하기</a>
	                        <input type="submit" class="btnSubmit" value="수정하기">
	                   </div>
	            	</form>
	        	</article>        
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>