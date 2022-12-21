<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	//체크박스 전체선택
	function selectAll(selectAll){
		const checkboxes = document.querySelectorAll("input[type='checkbox']");
		
		checkboxes.forEach((checkbox)=>{checkbox.checked = selectAll.checked})
	}
	//체크박스 선택삭제
	function deleteValue(){
		var checkBoxArr = [];
		
		$("input:checkbox[name='rowCheck']:checked").each(function(){
			checkBoxArr.push($(this).val());
			console.log(checkBoxArr);
		})
		
		$.ajax({
			url:'/admin/cs/faqDelete.do',
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
            <section id="admin-faq-list">
                <nav>
                    <h3>자주묻는질문 목록</h3>
                    <p>
                        HOME > 고객센터 > <strong>자주묻는질문</strong>
                    </p>
                </nav>
                <article class="list">
	                <select name="type1">
	                	<option value=0>1차유형선택</option>
	                	
	                </select>
	                <select name="type1">
	                	<option value=0>2차유형선택</option>
	                	
	                </select>
	                <table>
	                	<tr>
	                		<th><input type="checkbox" onclick="selectAll(this)"/></th>
	                		<th>번호</th>
	                		<th>1차 유형</th>
	                		<th>2차 유형</th>
	                		<th>제목</th>
	                		<th>조회</th>
	                		<th>날짜</th>
	                		<th>관리</th>
	                	</tr>
	                	<c:forEach var="article" items="${articles}">
		                	<tr>
		                		<td><input type="checkbox" name="rowCheck" value="${article.no}"/></td>
		                		<td>${article.no}</td>
		                		<td>
		                			<c:if test="${cate == null || cate eq ''}">${article.cate}</c:if>
		                			<c:if test="${cate != null}">${cate}</c:if>
		                		</td>
		                		<td>
		                			<c:if test="${cate2 == null || cate2 eq ''}">${article.cate2}</c:if>
		                			<c:if test="${cate2 != null}">${cate2}</c:if>
		                		</td>
		                		<td>
		                			<c:if test="${cate == null || cate eq ''}">
		                				<a href="./faqView.do?group=faq&cate=${article.cate}&cate=${article.cate2}&pg=${currentPage}&no=${article.no}">${article.title}
		                			</c:if>
		                			<c:if test="${cate != null}">
		                				<a href="./faqView.do?group=faq&cate=${cate}&cate=${article.cate2}&pg=${currentPage}&no=${article.no}">${article.title}
		                			</c:if>
		                		</td>
		                		<td>${article.hit}</td>
		                		<td>${article.rdate.substring(2, 10)}</td>
		                		<td>
		                			<c:if test="${cate == null || cate eq ''}">
		                				<a href="./deleteFaq.do?group=faq&cate=${article.cate}&cate=${article.cate2}&pg=${currentPage}&no=${article.no}">[삭제]
		                			</c:if>
		                			<c:if test="${cate != null}">
		                				<a href="./faqDelete.do?group=faq&cate=${cate}&cate=${article.cate2}&pg=${currentPage}&no=${article.no}">[삭제]
		                			</c:if>
		                			<br/>
		                			<c:if test="${cate == null || cate eq ''}">
		                				<a href="./faqModify.do?group=faq&cate=${article.cate}&cate=${article.cate2}&pg=${currentPage}&no=${article.no}">[수정]
		                			</c:if>
		                			<c:if test="${cate != null}">
		                				<a href="./faqModify.do?group=faq&cate=${cate}&cate=${article.cate2}&pg=${currentPage}&no=${article.no}">[수정]
		                			</c:if>
		                		</td>
		                	</tr>
	                	</c:forEach>
	                </table>
		            <c:if test="${cate == null || cate eq ''}">
			            <div class="page">
		                	<c:if test="${pageGroupStart > 1}">
		                    <a href="/Kmarket1/admin/cs/faqList.do?group=faq&pg=${pageGroupStart - 1}" class="prev">이전</a>
		                    </c:if>
		                    <c:forEach var="num" begin="${pageGroupStart}" end="${pageGroupEnd}">
		                    <a href="/Kmarket1/admin/cs/faqList.do?group=faq&pg=${num}" class="num ${num == currentPage ? 'current':'off' }">${num}</a>
		                    </c:forEach>
		                    <c:if test="${pageGroupEnd < lastPageNum}">
		                    <a href="/Kmarket1/admin/cs/faqList.do?group=faq&pg=${pageGroupEnd + 1}" class="next">다음</a>
		                    </c:if>
		                </div>
	                </c:if>
	                <c:if test="${cate != null}">
			            <div class="page">
		                	<c:if test="${pageGroupStart > 1}">
		                    <a href="/Kmarket1/admin/cs/faqList.do?group=faq&cate=${cate}&pg=${pageGroupStart - 1}" class="prev">이전</a>
		                    </c:if>
		                    <c:forEach var="num" begin="${pageGroupStart}" end="${pageGroupEnd}">
		                    <a href="/Kmarket1/admin/cs/faqList.do?group=faq&cate=${cate}&pg=${num}" class="num ${num == currentPage ? 'current':'off' }">${num}</a>
		                    </c:forEach>
		                    <c:if test="${pageGroupEnd < lastPageNum}">
		                    <a href="/Kmarket1/admin/cs/faqList.do?group=faq&cate=${cate}&pg=${pageGroupEnd + 1}" class="next">다음</a>
		                    </c:if>
		                </div>
	                </c:if>
	                <a href="#" class="btnDelete" onclick="deleteValue();">선택삭제</a>       
	                <a href="./faqWrite.do?group=faq" class="btnWrite">작성하기</a>       
	        	</article>        
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>