<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="/Kmarket1/img/favicon.ico" sizes="16x16" >
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>    
    <script src="/Kmarket1/admin/js/gnb.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/Kmarket1/admin/css/style.css">
    <title>케이마켓::관리자</title>
</head>
<body>
    <div id="admin-wrapper">
        <header>
            <div>
                <a href="/Kmarket1/admin/index.do" class="logo"><img src="/Kmarket1/admin/img/admin_logo.png" alt="admin_logo"/></a>
                <p>
                    <span>${ loginUser.name }님 반갑습니다.</span>
                    <a href="/Kmarket1/index.do">HOME |</a>
                    <a href="/Kmarket1/member/logout.do">로그아웃 |</a>
                    <a href="#">고객센터</a>
                </p>
            </div>
        </header>
        <style>
        #gnb > li > a > i {
            margin-right: 10px;
            font-size: 20px;
        }
		</style>
        <main>
            <aside>
                <!-- Global Navigation Bar -->
                <ul id="gnb">
                    <li>
                        <a href="#"><i class="fa fa-cogs" aria-hidden="true"></i>환경설정</a>
                        <ol>
                            <li><a href="#">기본환경설정</a></li>
                            <li><a href="#">배너관리</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-store" aria-hidden="true"></i>상점관리</a>
                        <ol>
                            <li><a href="#">판매자현황</a></li>
                            <li><a href="#">재고관리</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-users" aria-hidden="true"></i>회원관리</a>
                        <ol>
                            <li><a href="#">회원현황</a></li>
                            <li><a href="#">포인트관리</a></li>
                            <li><a href="#">비회원관리</a></li>
                            <li><a href="#">접속자집계</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-box-open" aria-hidden="true"></i>상품관리</a>
                        <ol>
                            <li><a href="/Kmarket1/admin/product/list.do">상품현황</a></li>
                            <li><a href="/Kmarket1/admin/product/register.do">상품등록</a></li>
                            <li><a href="#">재고관리</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-credit-card" aria-hidden="true"></i>주문관리</a>
                        <ol>
                            <li><a href="#">주문현황</a></li>
                            <li><a href="#">매출현황</a></li>
                            <li><a href="#">결제관리</a></li>
                            <li><a href="#">배송관리</a></li>
                        </ol>
                    </li>
                    <c:if test="${ loginUser.level eq 7 }">
                    <li>
                        <a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>고객센터</a>
                        <ol>
                            <li><a href="/Kmarket1/admin/cs/noticeList.do">공지사항</a></li>
                            <li><a href="/Kmarket1/admin/cs/faqList.do">자주묻는질문</a></li>
                            <li><a href="/Kmarket1/admin/cs/qnaList.do">문의하기</a></li>
                        </ol>
                    </li>
                    </c:if>
                </ul>
            </aside>