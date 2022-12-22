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
			url:'/admin/cs/qnaDelete.do',
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
            <section id="admin-qna-list">
                <nav>
                    <h3>문의하기 목록</h3>
                    <p>
                        HOME > 고객센터 > <strong>문의하기</strong>
                    </p>
                </nav>
                <article class="list">
	                <select name="type1" onchange="if(this.value) location.href=(this.value);">
	                	<c:if test="${cate != null}"><option value="${cate}" style="font-weight:bold;">${cate}</option></c:if>
	                	<c:if test="${cate == null || cate eq ''}"><option value=0>1차유형선택</option></c:if>
	                	<c:forEach var="ct" items="${category}">
	                		<option value="/Kmarket1/admin/cs/qnaList.do?group=qna&cate=${ct.cate}&cate2=">${ct.cate}</option>
	                	</c:forEach>
	                </select name="type2">
	                <select onchange="if(this.value) location.href=(this.value);">
                        <c:if test="${cate2 != null}"><option value=0 style="font-weight:bold;">${cate2}</option></c:if>
	                	<c:if test="${cate2 == null || cate2 eq ''}"><option value=0>2차유형선택</option></c:if>
	                	<c:forEach var="ct2" items="${category2}">
	                		<option value="/Kmarket1/admin/cs/qnaList.do?group=qna&cate=${cate}&cate2=${ct2.cate2}">${ct2.cate2}</option>
	                	</c:forEach>
                    </select>
	                <table>
	                	<tr>
	                		<th><input type="checkbox" onclick="selectAll(this)"/></th>
	                		<th>번호</th>
	                		<th>1차 유형</th>
	                		<th>2차 유형</th>
	                		<th>제목</th>
	                		<th>작성자</th>
	                		<th>작성일</th>
	                		<th>상태</th>
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
		                				<c:if test="${article.comment != null}">
		                					<a href="./qnaView.do?group=qna&cate=${article.cate}&cate2=${article.cate2}&pg=${currentPage}&no=${article.no}">${article.title}
		                				</c:if>
		                				<c:if test="${article.comment == null}">
		                					<a href="./qnaReply.do?group=qna&cate=${article.cate}&cate2=${article.cate2}&pg=${currentPage}&no=${article.no}">${article.title}
		                				</c:if>
		                			</c:if>
		                			<c:if test="${cate != null}">
		                				<c:if test="${article.comment != null}">
		                					<a href="./qnaView.do?group=qna&cate=${cate}&cate2=${article.cate2}&pg=${currentPage}&no=${article.no}">${article.title}
		                				</c:if>
		                				<c:if test="${article.comment == null}">
		                					<a href="./qnaReply.do?group=qna&cate=${cate}&cate2=${article.cate2}&pg=${currentPage}&no=${article.no}">${article.title}
		                				</c:if>
		                			</c:if>
		                		</td>
		                		<td>${article.uid}</td>
		                		<td>${article.rdate.substring(2, 10)}</td>
		                		<td>
		                			<c:if test="${article.comment == null}"><span style="color:#cecbcb; font-weight:bold">검토중</span></c:if>
                        			<c:if test="${article.comment != null}"><span style="color:#2da9e9; font-weight:bold">답변완료</span></c:if>
		                		</td>
		                	</tr>
	                	</c:forEach>
	                </table>
	                <c:if test="${cate == null || cate eq ''}">
			            <div class="page">
		                	<c:if test="${pageGroupStart > 1}">
		                    <a href="/Kmarket1/admin/cs/qnaList.do?group=qna&cate=${article.cate}&cate2=${article.cate2}&pg=${currentPage}pg=${pageGroupStart - 1}" class="prev">이전</a>
		                    </c:if>
		                    <c:forEach var="num" begin="${pageGroupStart}" end="${pageGroupEnd}">
		                    <a href="/Kmarket1/admin/cs/qnaList.do?group=qna&cate=${article.cate}&cate2=${article.cate2}&pg=${currentPage}pg=${num}" class="num ${num == currentPage ? 'current':'off' }">${num}</a>
		                    </c:forEach>
		                    <c:if test="${pageGroupEnd < lastPageNum}">
		                    <a href="/Kmarket1/admin/cs/qnaList.do?group=qna&cate=${article.cate}&cate2=${article.cate2}&pg=${currentPage}&pg=${pageGroupEnd + 1}" class="next">다음</a>
		                    </c:if>
		                </div>
	                </c:if>
	                <c:if test="${cate != null}">
			            <div class="page">
		                	<c:if test="${pageGroupStart > 1}">
		                    <a href="/Kmarket1/admin/cs/qnaList.do?group=qna&cate=${cate}&cate2=${article.cate2}&pg=${pageGroupStart - 1}" class="prev">이전</a>
		                    </c:if>
		                    <c:forEach var="num" begin="${pageGroupStart}" end="${pageGroupEnd}">
		                    <a href="/Kmarket1/admin/cs/qnaList.do?group=qna&cate=${cate}&cate2=${article.cate2}&pg=${num}" class="num ${num == currentPage ? 'current':'off' }">${num}</a>
		                    </c:forEach>
		                    <c:if test="${pageGroupEnd < lastPageNum}">
		                    <a href="/Kmarket1/admin/cs/qnaList.do?group=qna&cate=${cate}&cate2=${article.cate2}&pg=${pageGroupEnd + 1}" class="next">다음</a>
		                    </c:if>
		                </div>
	                </c:if>
	                <a href="#" class="btnDelete" onclick="deleteValue();">선택삭제</a>       
	        	</article>        
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>