<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
			<form action="/Kmarket1/index.do" method="POST">
                <input type="text" name="serach">
                <button>
                    <i class="fa fa-search" aria-hidden="true"> </i>
                </button>
            </form>
        </div>
    </div>
	<div class="menu">
	    <div>
	        <ul>
	            <li><a href="#">히트상품</a></li>
	            <li><a href="#">추천상품</a></li>
	            <li><a href="#">최신상품</a></li>
	            <li><a href="#">인기상품</a></li>
	            <li><a href="#">할인상품</a></li>
	        </ul>
	        <ul>
	            <li><a href="/Kmarket1/cs/notice/list.do?group=notice">공지사항</a></li>
	            <li><a href="/Kmarket1/cs/faq/list.do?group=faq&cate=회원">자주묻는질문</a></li>
	            <li><a href="/Kmarket1/cs/qna/list.do?group=qna&cate=회원">문의하기</a></li>
	            <li><a href="/Kmarket1/cs/index.do">고객센터</a></li>
	        </ul>
	    </div>
	</div>
</header>