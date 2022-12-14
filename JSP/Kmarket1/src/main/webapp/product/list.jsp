<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="../_menu.jsp"/>
    <style>
      
    </style>
</head>
<body>
    <div id="wrapper">
        <header>
            <div class="top">
                <div>
                    <a href="#">로그인</a>
                    <a href="#">회원가입</a>
                    <a href="#">마이페이지</a>
                    <a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i> 장바구니</a>
                </div>
            </div>

            <div class="logo">
                <div>
                    <a href="#">
                        <img src="../img/header_logo.png" alt="로고">
                    </a>
                    <form action="#">
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
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">자주묻는질문</a></li>
                        <li><a href="#">문의하기</a></li>
                        <li><a href="#">고객센터</a></li>
                      </ul>
                </div>
            </div>
                </header>

        <main id="product">
            <!-- cate -->
            <aside>
                <ul class="category">     
                    <li><i class="fa fa-bars" aria-hidden="true"></i>카테고리</li>
                    <li>
                        <a href="#"><i class="fas fa-tshirt" aria-hidden="true"></i>패션·의류·뷰티</a>
                        <ol>
                            <li><a href="#">남성의류</a></li>
                            <li><a href="#">여성의류</a></li>
                            <li><a href="#">잡화</a></li>
                            <li><a href="#">뷰티</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-laptop" aria-hidden="true"></i>가전·디지털</a>
                        <ol> 
                            <li><a href="#">노트북/PC</a></li>
                            <li><a href="#">가전</a></li>
                            <li><a href="#">휴대폰</a></li>
                            <li><a href="#">기타</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-utensils" aria-hidden="true"></i>식품·생필품</a>
                        <ol>
                            <li><a href="#">신선식품</a></li>
                            <li><a href="#">가공식품</a></li>
                            <li><a href="#">건강식품</a></li>
                            <li><a href="#">생필품</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#"><i class="fas fa-home" aria-hidden="true"></i>홈·문구·취미</a>
                        <ol>
                            <li><a href="#">가구/DIY</a></li>
                            <li><a href="#">침구·커튼</a></li>
                            <li><a href="#">생활용품</a></li>
                            <li><a href="#">사무용품</a></li>
                        </ol>
                    </li>
                </ul>
            </aside>
            <!-- 새 내용 -->
            <section class="list">
                <!-- title, page nav -->
                <nav>
                    <h1>상품목록</h1>
                    <p>HOME &gt; <span>패션·의류·뷰티</span> &gt; <strong>남성의류</strong></p>
                </nav>
                <!-- sort menu -->
                <ul class="sort">
                    <li><a href="#" class="on">판매많은순</a></li>
                    <li><a href="#">낮은가격순</a></li>
                    <li><a href="#">높은가격순</a></li>
                    <li><a href="#">평점높은순</a></li>
                    <li><a href="#">후기많은순</a></li>
                    <li><a href="#">최근등록순</a></li>
                </ul>
                <!-- product list -->
                <table border="0">                  
                    <tbody>
                        <tr>
                            <td>
                                <a href="#" class="thumb"><img src="https://via.placeholder.com/120x120" alt="상품이미지"></a>
                            </td>
                            <td>
                                <h3 class="name">상품명</h3>
                                <a href="#" class="desc">상품설명</a>
                            </td>
                            <td>
                                <ul>
                                    <li><ins class="dis-price">27,000</ins></li>
                                    <li>
                                        <del class="org-price">30,000</del>
                                        <span class="discount">10%</span>
                                    </li>
                                    <li><span class="free-delivery">무료배송</span></li>
                                </ul>
                            </td>
                            <td>
                                <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i>&nbsp;판매자</h4>
                                <h5 class="badge power">판매자등급</h5>
                                <h6 class="rating star1">상품평</h6>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="#" class="thumb"><img src="https://via.placeholder.com/120x120" alt="상품이미지"></a>
                            </td>
                            <td>
                                <h3 class="name">상품명</h3>
                                <a href="#" class="desc">상품설명</a>
                            </td>
                            <td>
                                <ul>
                                    <li><ins class="dis-price">27,000</ins></li>
                                    <li>
                                        <del class="org-price">30,000</del>
                                        <span class="discount">10%</span>
                                    </li>
                                    <li><span class="free-delivery">무료배송</span></li>
                                </ul>
                            </td>
                            <td>
                                <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i>&nbsp;판매자</h4>
                                <h5 class="badge power">판매자등급</h5>
                                <h6 class="rating star2">상품평</h6>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="#" class="thumb"><img src="https://via.placeholder.com/120x120" alt="상품이미지"></a>
                            </td>
                            <td>
                                <h3 class="name">상품명</h3>
                                <a href="#" class="desc">상품설명</a>
                            </td>
                            <td>
                                <ul>
                                    <li><ins class="dis-price">27,000</ins></li>
                                    <li>
                                        <del class="org-price">30,000</del>
                                        <span class="discount">10%</span>
                                    </li>
                                    <li><span class="free-delivery">무료배송</span></li>
                                </ul>
                            </td>
                            <td>
                                <h4 class="seller"><i class="fas fa-home" aria-hidden="true"></i>&nbsp;판매자명</h4>
                                <h5 class="badge power">판매자등급</h5>
                                <h6 class="rating star3">상품평</h6>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- page number -->
                <div class="paging">
                    <span class="prev">
                        <a href="#">&lt; 이전</a>
                    </span>
                    <span class="num">
                        <a href="#" class="on">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">6</a>
                        <a href="#">7</a>
                    </span>
                    <span class="next">
                        <a href="#">다음&nbsp;&gt;</a>
                    </span>
                </div>
            </section>
            <!-- 새 내용 -->
        </main>
<jsp:include page="../_footer.jsp"/>