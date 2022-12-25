<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
            <section id="admin-qna-view">
                <nav>
                    <h3>문의하기 보기</h3>
                    <p>
                        HOME > 고객센터 > <strong>문의하기</strong>
                    </p>
                </nav>
                <article class="list">
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
		               		<td>${article.comment}</td>
		               	</tr>
		               </table>
		               <div>
		               	   <a href="/Kmarket1/admin/cs/qnaList.do?group=qna&cate=${cate}&cate=${cate2}&pg=${pg}" class="btnList">목록</a>
		                   <a href="./qnaDelete.do?group=${group}&cate=${cate}&cate=${cate2}&no=${no}&pg=${pg}" class="btnDelete">삭제</a>
		        		</div>
		        	</form>
	        	</article>        
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>