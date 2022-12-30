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
		let checkBoxArr = [];
		
		$("input:checkbox[name='rowCheck']:checked").each(function(){
			checkBoxArr.push($(this).val());
			console.log(checkBoxArr);
		})
		let ans = confirm("삭제하시겠습니까?");
		if(ans){
			$.ajax({
				url:'/Kmarket1/admin/cs/noticeDelete.do',
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
            <section id="admin-notice-list">
                <nav>
                    <h3>공지사항 목록</h3>
                    <p>
                        HOME > 고객센터 > <strong>공지사항</strong>
                    </p>
                </nav>
                <article class="list">
	                <select onchange="if(this.value) location.href=(this.value);">
	                	<c:if test="${cate != null}"><option value=0 style="font-weight:bold;">${cate}</option></c:if>
	                	<c:if test="${cate == null || cate eq ''}"><option value=0>유형선택</option></c:if>
	                	<option value="/Kmarket1/admin/cs/noticeList.do?group=notice&cate=고객서비스&pg=1">고객서비스</option>
	                	<option value="/Kmarket1/admin/cs/noticeList.do?group=notice&cate=안전거래&pg=1">안전거래</option>
	                	<option value="/Kmarket1/admin/cs/noticeList.do?group=notice&cate=위해상품&pg=1">위해상품</option>
	                	<option value="/Kmarket1/admin/cs/noticeList.do?group=notice&cate=이벤트당첨&pg=1">이벤트당첨</option>
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
		                		<td>
		                			<c:if test="${cate == null || cate eq ''}">${article.cate}</c:if>
		                			<c:if test="${cate != null}">${cate}</c:if>
		                		</td>
		                		<td>
		                			<c:if test="${cate == null || cate eq ''}">
		                				<a href="/Kmarket1/admin/cs/noticeView.do?group=notice&cate=${article.cate}&pg=${currentPage}&no=${article.no}">${article.title}
		                			</c:if>
		                			<c:if test="${cate != null}">
		                				<a href="/Kmarket1/admin/cs/noticeView.do?group=notice&cate=${cate}&pg=${currentPage}&no=${article.no}">${article.title}
		                			</c:if>
		                		</td>
		                		<td>${article.hit}</td>
		                		<td>${article.rdate.substring(2, 10)}</td>
		                		<td>
		                			<c:if test="${cate == null || cate eq ''}">
		                				<a href="/Kmarket1/admin/cs/noticeDelete.do?group=notice&cate=${article.cate}&pg=${currentPage}&no=${article.no}" onclick="return deleteClick();">[삭제]
		                			</c:if>
		                			<c:if test="${cate != null}">
		                				<a href="/Kmarket1/admin/cs/noticeDelete.do?group=notice&cate=${cate}&pg=${currentPage}&no=${article.no}" onclick="return deleteClick();">[삭제]
		                			</c:if>
		                			<br/>
		                			<c:if test="${cate == null || cate eq ''}">
		                				<a href="/Kmarket1/admin/cs/noticeModify.do?group=notice&cate=${article.cate}&pg=${currentPage}&no=${article.no}">[수정]
		                			</c:if>
		                			<c:if test="${cate != null}">
		                				<a href="/Kmarket1/admin/cs/noticeModify.do?group=notice&cate=${cate}&pg=${currentPage}&no=${article.no}">[수정]
		                			</c:if>
		                		</td>
		                	</tr>
	                	</c:forEach>
	                </table>
	                <c:if test="${cate == null || cate eq ''}">
			            <div class="page">
		                	<c:if test="${pageGroupStart > 1}">
		                    <a href="/Kmarket1/admin/cs/noticeList.do?group=notice&pg=${pageGroupStart - 1}" class="prev">이전</a>
		                    </c:if>
		                    <c:forEach var="num" begin="${pageGroupStart}" end="${pageGroupEnd}">
		                    <a href="/Kmarket1/admin/cs/noticeList.do?group=notice&pg=${num}" class="num ${num == currentPage ? 'current':'off' }">${num}</a>
		                    </c:forEach>
		                    <c:if test="${pageGroupEnd < lastPageNum}">
		                    <a href="/Kmarket1/admin/cs/noticeList.do?group=notice&pg=${pageGroupEnd + 1}" class="next">다음</a>
		                    </c:if>
		                </div>
	                </c:if>
	                <c:if test="${cate != null}">
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
	                </c:if>
	                <a href="#" class="btnDelete" onclick="deleteValue();">선택삭제</a>       
	                <a href="./noticeWrite.do?group=notice" class="btnWrite">작성하기</a>       
	        	</article>        
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>