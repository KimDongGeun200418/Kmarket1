<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
            <section id="admin-faq-view">
                <nav>
                    <h3>자주묻는질문 보기</h3>
                    <p>
                        HOME > 고객센터 > <strong>자주묻는질문</strong>
                    </p>
                </nav>
                <article class="list">
	               <table>
	               	<tr>
	               		<th>유형</th>
	               		<td>${article.cate}-${article.cate2}</td>
	               	</tr>
	               	<tr>
	               		<th>제목</th>
	               		<td>${article.title}</td>
	               	</tr>
	               	<tr>
	               		<th>내용</th>
	               		<td>${article.content}</td>
	               	</tr>
	               </table>
	               <div>
	               	   <a href="/Kmarket1/admin/cs/faqList.do?group=faq&cate=${cate}&cate2=${cate2}&pg=${pg}" class="btnList">목록</a>
	                   <a href="./faqModify.do?group=${group}&cate=${article.cate}&cate2=${article.cate2}&no=${no}&pg=${pg}" class="btnModify">수정</a>
	                   <a href="./faqDelete.do?group=${group}&cate=${cate}&cate2=${cate2}&no=${no}&pg=${pg}" class="btnDelete">삭제</a>
	        		</div>
	        	</article>        
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>