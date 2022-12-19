<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	function selectAll(selectAll){
		const checkboxes = document.querySelectorAll("input[type='checkbox']");
		
		checkboxes.forEach((checkbox)=>{checkbox.checked = selectAll.checked})
	}
	
	function deleteValue(){
		var checkBoxArr = [];
		
		$("input:checkbox[name='rowCheck']:checked").each(function(){
			checkBoxArr.push($(this).val());
			console.log(checkBoxArr);
		})
		
		$.ajax({
			url:'/admin/cs/deleteNotice.do',
			type:'get',
			data:{checkBoxArr:checkBoxArr},
			dataType:'json',
			success:function(result){
				if(result == 1){
					location.reload();
				}
			}
		});
	}
</script>
<jsp:include page="../_header.jsp"/>
            <section id="admin-notice-list">
                <nav>
                    <h3>공지사항 목록</h3>
                    <p>
                        HOME > 고객센터 > <strong>공지사항</strong>
                    </p>
                </nav>
                <article class="list">
	                <select onchange="if(this.value) location.href=(this.value);">
	                	<option value=0>유형선택</option>
	                	<option value="/Kmarket1/admin/cs/noticeList.do?group=notice&cate=service&pg=1">고객서비스</option>
	                	<option value="/Kmarket1/admin/cs/noticeList.do?group=notice&cate=safety&pg=1">안전거래</option>
	                	<option value="/Kmarket1/admin/cs/noticeList.do?group=notice&cate=product&pg=1">위해상품</option>
	                	<option value="/Kmarket1/admin/cs/noticeList.do?group=notice&cate=event&pg=1">이벤트당첨</option>
	                </select>
	                <table>
	                	<tr>
	                		<th><input type="checkbox" onclick="selectAll(this)"/></th>
	                		<th>번호</th>
	                		<th>유형</th>
	                		<th>제목</th>
	                		<th>조회</th>
	                		<th>날짜</th>
	                		<th>관리</th>
	                	</tr>
	                	<c:forEach var="article" items="${articles}">
		                	<tr>
		                		<td><input type="checkbox" name="rowCheck" value="${article.no}"/></td>
		                		<td>${article.no}</td>
		                		<td>${cate}</td>
		                		<td><a href="./view.do?group=notice&cate=${article.cate}&pg=${currentPage}&no=${article.no}">${article.title}</td>
		                		<td>${article.hit}</td>
		                		<td>${article.rdate.substring(2, 10)}</td>
		                		<td>
		                			<a href="#">[삭제]</a><br/>
		                			<a href="#">[수정]</a>
		                		</td>
		                	</tr>
	                	</c:forEach>
	                </table>
		            <div class="page">
	                	<c:if test="${pageGroupStart > 1}">
	                    <a href="/Kmarket1/admin/cs/noticeList.do?group=notice&cate=${cate}&pg=${pageGroupStart - 1}" class="prev">이전</a>
	                    </c:if>
	                    <c:forEach var="num" begin="${pageGroupStart}" end="${pageGroupEnd}">
	                    <a href="/Kmarket1/admin/cs/noticeList.do?group=notice&cate=${cate}&pg=${num}" class="num ${num == currentPage ? 'current':'off' }">${num}</a>
	                    </c:forEach>
	                    <c:if test="${pageGroupEnd < lastPageNum}">
	                    <a href="/Kmarket1/admin/cs/noticeList.do?group=notice&cate=${cate}&pg=${pageGroupEnd + 1}" class="next">다음</a>
	                    </c:if>
	                </div>
	                <a href="./deleteNotice.do?group=notice" class="btnDelete" onclick="deleteValue();">선택삭제</a>       
	                <a href="./write.do?group=notice" class="btnWrite">작성하기</a>       
	        	</article>        
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>