<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
            <section id="admin-notice-view">
                <nav>
                    <h3>공지사항 보기</h3>
                    <p>
                        HOME > 고객센터 > <strong>공지사항</strong>
                    </p>
                </nav>
                <article class="list">
	               <table>
	               	<tr>
	               		<th>유형</th>
	               		<td>${article.cate}</td>
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
	               		<a href="/Kmarket1/admin/cs/noticeList.do?group=notice&cate=${cate}&pg=${pg}" class="btnList">목록</a>
	               		<a href="./noticeModify.do?group=${group}&cate=${article.cate}&no=${no}&pg=${pg}" class="btnModify">수정</a>
	                    <a href="./noticeDelete.do?group=${group}&cate=${cate}&no=${no}&pg=${pg}" class="btnDelete">삭제</a>
	        		</div>
	        	</article>        
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>