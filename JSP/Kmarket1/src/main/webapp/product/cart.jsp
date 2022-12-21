<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_menu.jsp"/>
<link rel="stylesheet" href="/Kmarket1/product/css/product_cart.css">
<link rel="stylesheet" href="/Kmarket1/product/css/product.css">
    <style>
        

    </style>

        <main id="product">
            <!-- cate -->
            <aside>
            	<jsp:include page="../_cate.jsp"/>
            </aside>
            
            <section class="cart">
                <!-- 제목, 페이지 네비게이션 -->
                <nav>
                  <h1>장바구니</h1>
                  <p>
                    HOME &gt; <span>패션·의류·뷰티</span> &gt; <strong>장바구니</strong>
                  </p>
                </nav>
                              
                <form action="#">
                  <!-- 장바구니 목록 -->
                  <table>
                    <thead>
                      <tr>
                        <th><input type="checkbox" name="all"></th>
                        <th>상품명</th>
                        <th>총수량</th>
                        <th>판매가</th>
                        <th>할인</th>
                        <th>포인트</th>
                        <th>배송비</th>
                        <th>소계</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${ products }">
                      <tr class="empty">
                        <td colspan="7">장바구니에 상품이 없습니다.</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name=""></td>
                        <td>
                          <article>
                            <a href="/Kmarket1/product.do?no=${ product.prodNo }"><img src="https://via.placeholder.com/80x80" alt=""></a>
                            <div>
                              <h2><a href="#">${ product.prodName }</a></h2>
                              <p>${ product.descript }</p>
                            </div>
                          </article>
                        </td>
                        <td>${ product.count }</td>
                        <td>${ product.price }</td>
                        <td>${ product.discount }</td>
                        <td>${ product.point }</td>
                        <td>${ product.delivery }</td>
                        <td>${ product.total }</td>
                      </tr>
                      </c:forEach>
                      
                      <tr>
                        <td><input type="checkbox" name=""></td>
                        <td>
                          <article>
                            <a href="#"><img src="https://via.placeholder.com/80x80" alt=""></a>
                            <div>
                              <h2><a href="#">상품명</a></h2>
                              <p>상품설명</p>
                            </div>
                          </article>
                        </td>
                        <td>1</td>
                        <td>27,000</td>
                        <td>5%</td>
                        <td>270</td>
                        <td>무료배송</td>
                        <td>27,000</td>
                      </tr>
                      <tr>
                        <td><input type="checkbox" name=""></td>
                        <td>
                          <article>
                            <a href="#"><img src="https://via.placeholder.com/80x80" alt=""></a>
                            <div>
                              <h2><a href="#">상품명</a></h2>
                              <p>상품설명</p>
                            </div>
                          </article>
                        </td>
                        <td>1</td>
                        <td>27,000</td>
                        <td>5%</td>
                        <td>270</td>
                        <td>무료배송</td>
                        <td>27,000</td>
                      </tr>
                      
                    </tbody>
                  </table>
                  <input type="button" name="del" value="선택삭제">
  
                  <!-- 장바구니 전체합계 -->
                  <div class="total">
                    <h2>전체합계</h2>
                    <table border="0">
                      <tbody><tr>
                        <td>상품수</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td>상품금액</td>
                        <td>27,000</td>
                      </tr>
                      <tr>
                        <td>할인금액</td>
                        <td>-1,000</td>
                      </tr>
                      <tr>
                        <td>배송비</td>
                        <td>0</td>
                      </tr>              
                      <tr>
                        <td>포인트</td>
                        <td>260</td>
                      </tr>
                      <tr>
                        <td>전체주문금액</td>
                        <td>26,000</td>
                      </tr>
                    </tbody></table>
                    <input type="submit" name="" value="주문하기">    
                  </div>
  
                </form>
  
              </section>
        </main>
<jsp:include page="../_footer.jsp"/>