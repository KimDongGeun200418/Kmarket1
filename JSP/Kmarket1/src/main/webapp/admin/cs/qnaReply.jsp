<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
            <section id="admin-qna-view">
                <nav>
                    <h3>문의하기 답변</h3>
                    <p>
                        HOME > 고객센터 > <strong>문의하기</strong>
                    </p>
                </nav>
                <article class="list">
                	<form action="./qnaReply.do" method="post">
	                	<input type="hidden" name="group" value="${group}">
	                	<input type="hidden" name="cate" value="${cate}">
	                	<input type="hidden" name="pg" value="${pg}">
	                	<input type="hidden" name="no" value="${no}">
		               <table>
		               	<tr>
		               		<th>유형</th>
		               		<td>${cate}-${article.cate2}</td>
		               	</tr>
		               	<tr>
		               		<th>제목</th>
		               		<td>${article.title}</td>
		               	</tr>
		               	<tr>
		               		<th>내용</th>
		               		<td>${article.content}</td>
		               	</tr>
		               	<tr>
		               		<th>답변</th>
		               		<td>
		               			<textarea name="comment"></textarea>
		               		</td>
		               	</tr>
		               </table>
		               <div>
		                   <a href="/Kmarket1/admin/cs/qnaList.do?group=qna&cate=${cate}&cate=${cate2}&pg=${pg}" class="btnList">목록</a>
		                   <input type="submit" class="btnDelete" value="등록하기">
		        		</div>
		        	</form>
	        	</article>        
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>