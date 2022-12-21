<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
            <section id="admin-faq-write">
                <nav>
                    <h3>공지사항 수정</h3>
                    <p>
                        HOME > 고객센터 > <strong>공지사항</strong>
                    </p>
                </nav>
                <article class="list">
                	<form action="./faqModify.do" method="post">
	                   <input type="hidden" name="group" value="${group}"/>
	                   <input type="hidden" name="pg" value="${pg}"/>
	                   <input type="hidden" name="no" value="${no}"/>
	        		   <input type="hidden" name="uid" value="${uid}"/>
		               <table>
		               	<tr>
		               		<th>유형</th>
		               		<td>
		               			<select name="type1">
		               				<c:forEach var="article" items="${articles}">
	                                    <option value="${article.cate}" <c:if test="${cate} == ${article.cate}">selected</c:if>>${article.cate}</option>
	                                </c:forEach>    
	                            </select>
		               		</td>
		               		<td>
		               			<select name="type2">
		               				<c:forEach var="article" items="${articles}">
	                                    <option value="${article.cate2}" <c:if test="${cate2} == ${article.cate2}">selected</c:if>>${article.cate2}</option>
	                                </c:forEach>    
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
	                        <a href="/Kmarket1/admin/cs/faqView.do?group=${group}&cate=${cate}&no=${no}&pg=${pg}" class="btnList">취소하기</a>
	                        <input type="submit" class="btnSubmit" value="수정하기">
	                   </div>
	            	</form>
	        	</article>        
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>