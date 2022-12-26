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
		
		let ans = confirm("삭제하시겠습니까?");
		if(ans){
			$.ajax({
				url:'/Kmarket1/admin/cs/faqDelete.do',
				type:'post',
				traditional: true,//ajax 배열 넘기기 옵션
				data:{'checkBoxArr':checkBoxArr},
				dataType:'json',
				success:function(data){
					if(data.result > 0){
						location.reload();
					}
				}
			});
		}
	}
	//삭제버튼 클릭
	function deleteClick(){
		return confirm("삭제하시겠습니까?");
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
	                <select name="type1" onchange="if(this.value) location.href=(this.value);">
	                	<c:if test="${cate != null}"><option value=0 style="font-weight:bold;">${cate}</option></c:if>
	                	<c:if test="${cate == null || cate eq ''}"><option value=0>1차유형선택</option></c:if>
	                	<c:forEach var="ct" items="${category}">
	                		<option value="/Kmarket1/admin/cs/faqList.do?group=faq&cate=${ct.cate}&cate2=">${ct.cate}</option>
	                	</c:forEach>
	                </select name="type2">
	                <select onchange="if(this.value) location.href=(this.value);">
	                	<option value=0>2차유형선택</option>
	                	<c:forEach var="ct2" items="${category2}">
	                		<option value="/Kmarket1/admin/cs/faqList.do?group=faq&cate=${cate}&cate2=${ct2.cate2}">${ct2.cate2}</option>
	                	</c:forEach>
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
	                	<c:forEach var="article" items="${articles}" begin="0" end="9">
		                	<tr>
		                		<td><input type="checkbox" name="rowCheck" value="${article.no}"/></td>
		                		<td>${article.no}</td>
		                		<td>
		                			<c:choose>
		               				<c:when test="${cate != null}">${cate}</c:when>
		                			<c:otherwise>${article.cate}</c:otherwise>
		                			</c:choose>
		                		</td>
		                		<td>
		                			<c:if test="${cate != null && cate2 != null}">${cate2}</c:if>
		                			<c:if test="${cate != null && (cate2 == null || cate2 eq '')}">${article.cate2}</c:if>
		                			<c:if test="${cate == null && (cate2 == null || cate2 eq '')}">${article.cate2}</c:if>
		                		</td>
		                		<td>
		                			<c:choose>
	                				<c:when test="${cate != null}">
	                					<c:choose>
	                					<c:when test="${cate2 != null}">
	                						<a href="./faqView.do?group=faq&cate=${cate}&cate2=${cate2}&no=${article.no}">${article.title}
	                					</c:when>
	                					<c:otherwise>
	                						<a href="./faqView.do?group=faq&cate=${cate}&cate2=${article.cate2}&no=${article.no}">${article.title}
	                					</c:otherwise>
	                					</c:choose>
		                			</c:when>
		                			<c:otherwise>
	                					<a href="./faqView.do?group=faq&cate=${cate}&cate2=${article.cate2}&no=${article.no}">${article.title}
		                			</c:otherwise>
		                			</c:choose>
		                		</td>
		                		<td>${article.hit}</td>
		                		<td>${article.rdate.substring(2, 10)}</td>
		                		<td>
		                			<c:choose>
		                				<c:when test="${cate != null}">
		                					<c:choose>
		                					<c:when test="${cate2 != null}">
		                						<a href="./faqDelete.do?group=faq&cate=${cate}&cate2=${cate2}&no=${article.no}" onclick="return deleteClick();">[삭제]<br>
		                						<a href="./faqModify.do?group=faq&cate=${cate}&cate2=${cate2}&no=${article.no}">[수정]
		                					</c:when>
		                					<c:otherwise>
		                						<a href="./faqDelete.do?group=faq&cate=${cate}&cate2=${article.cate2}&no=${article.no}" onclick="return deleteClick();">[삭제]<br>
		                						<a href="./faqModify.do?group=faq&cate=${cate}&cate2=${article.cate2}&no=${article.no}">[수정]
		                					</c:otherwise>
		                					</c:choose>
		                				</c:when>
		                				<c:otherwise>
		                					<a href="./faqDelete.do?group=faq&cate=${article.cate}&cate2=${article.cate2}&no=${article.no}" onclick="return deleteClick();">[삭제]<br>
		                					<a href="./faqModify.do?group=faq&cate=${article.cate}&cate2=${article.cate2}&no=${article.no}">[수정]
		                				</c:otherwise>
		                			</c:choose>
		                		</td>
		                	</tr>
	                	</c:forEach>
	                </table>
	                <a href="#" class="btnDelete" onclick="deleteValue();">선택삭제</a>       
	                <a href="./faqWrite.do?group=faq" class="btnWrite">작성하기</a>       
	        	</article>        
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>