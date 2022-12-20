<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="./_header.jsp"/>
<jsp:include page="./_menu.jsp"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="/Kmarket1/js/index.js"></script>
<script>
    $(document).ready(function () {
      $(".slider ul").bxSlider({
        easing: "linear",
      });
    });
    $(function () {
      var best = $("aside > .best");
      $(window).scroll(function () {
        var t = $(this).scrollTop();
        if (t > 620) {
          best.css({
            position: "fixed",
            top: "0",
          });
        } else {
          best.css({ position: "static" });
        }
      });
    });
</script>
<style>
    
</style>
    
<main>
    <!-- cate, best product -->
    <aside>
        <!-- cate -->
        <jsp:include page="./_cate.jsp"/>
        
        <!-- side bar -->
        <article class="best" style="position: static;">
            <h1><i class="fas fa-crown" aria-hidden="true"></i>베스트상품</h1>
            <ol>
            	<c:forEach var="bestProduct" items="${ bestProducts }">
              	<li>
                <a href="/Kmarket1/product/productView.do?prodNo=${ bestProduct.prodNo }">
                  	<div class="thumb">
                  		<i>1</i>
                    	<img src="/Kmarket1/productImg/${ bestProduct.thumb1 }" alt="item1">
                  	</div>
                  	<h2>${ bestProduct.prodName }</h2>
                  	<div class="org_price">
                    	<del><fmt:formatNumber value="${ bestProduct.price }"  pattern="#,###" /></del>
                    	<span>${ bestProduct.discount }%</span>
                  	</div>
                  	<div class="dis_price">
                    	<ins><fmt:formatNumber value="${ bestProduct.price * (1-(bestProduct.discount/100)) }"  pattern="#,###" /></ins>
                  	</div>
              	</a>
              	</li>
              	</c:forEach>
        	</ol>
		</article>
    </aside>
    <!-- main product page -->
    <section id="main">
        <!-- slider -->
        <section class="slider">
            <div class="bx-wrapper" style="max-width: 100%;">
                <div class="bx-viewport" aria-live="polite" style="width: 100%; overflow: hidden; position: relative; height: 447px;">
                    <ul style="width: 5215%; position: relative; transition-timing-function: linear; transition-duration: 0.5s; transform: translate3d(-1970px, 0px, 0px);">
                        <li style="float: left; list-style: none; position: relative; width: 985px;" class="bx-clone" aria-hidden="true">
                            <a href="#"><img src="/Kmarket1/bannerImg/banner4.jpg" alt="item1"></a>
                        </li>
                        <li style="float: left; list-style: none; position: relative; width: 985px;" aria-hidden="true">
                            <a href="#"><img src="/Kmarket1/bannerImg/banner1.jpg" alt="item2"></a>
                        </li>
                        <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 985px;">
                            <a href="#"><img src="/Kmarket1/bannerImg/banner2.jpg" alt="item3"></a>
                        </li>
                        <li aria-hidden="true" style="float: left; list-style: none; position: relative; width: 985px;">
                            <a href="#"><img src="/Kmarket1/bannerImg/banner3.jpg" alt="item4"></a>
                        </li>
                        <li style="float: left; list-style: none; position: relative; width: 985px;" class="bx-clone" aria-hidden="true">
                            <a href="#"><img src="/Kmarket1/bannerImg/banner5.jpg" alt="item5"></a>
                        </li>
                    </ul>
                </div>
                <div class="bx-controls bx-has-controls-direction bx-has-pager">
                    
                    <div class="bx-pager bx-default-pager">
                        <div class="bx-pager-item">
                            <a href="" data-slide-index="0" class="bx-pager-link">1</a>
                        </div>
                        <div class="bx-pager-item">
                            <a href="" data-slide-index="1" class="bx-pager-link active">2</a>
                        </div>
                        <div class="bx-pager-item">
                            <a href="" data-slide-index="2" class="bx-pager-link">3</a>
                        </div>
                        <div class="bx-pager-item">
                            <a href="" data-slide-index="3" class="bx-pager-link">4</a>
                        </div>
                        <div class="bx-pager-item">
                            <a href="" data-slide-index="4" class="bx-pager-link">5</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- hit -->
        <section class="hit">
        	<h3><span>히트상품</span></h3>
        	<c:forEach var="hitProduct" items="${ hitProducts }">
            <article>
              	<a href="/Kmarket1/product/productView.do?prodNo=${ hitProduct.prodNo }">
                	<div class="thumb">
                  		<img src="/Kmarket1/productImg/${ hitProduct.thumb1 }" alt="t1">
                	</div>
                	<h2>${ hitProduct.prodName }</h2>
               		<p>${ hitProduct.descript }</p>
                	<div class="org_price">
                    	<del><fmt:formatNumber value="${ hitProduct.price }"  pattern="#,###" /></del>
                    	<span>${ hitProduct.discount }%</span>
                  	</div>
                	<div class="dis_price">
                  		<ins><fmt:formatNumber value="${ hitProduct.price * (1-(hitProduct.discount/100)) }"  pattern="#,###" /></ins>
                  		<c:choose>
                  			<c:when test="${ hitProduct.delivery == '0' }">
                  				<span class="free">무료배송</span>
                  			</c:when>
                  			<c:otherwise>
                  				<span class="delivery">배송비 ${ hitProduct.delivery }</span>
                  			</c:otherwise>
               			</c:choose>
                	</div>
              	</a>
            </article>
            </c:forEach>
		</section>
        <!-- recommend -->
        <section class="recommend">
        	<h3><span>추천상품</span></h3>
        	<c:forEach var="scoreProduct" items="${ scoreProducts }">
            <article>
              	<a href="/Kmarket1/product/productView.do?prodNo=${ scoreProduct.prodNo }">
                	<div class="thumb">
                  		<img src="/Kmarket1/productImg/${ scoreProduct.thumb1 }" alt="t1">
                	</div>
                	<h2>${ scoreProduct.prodName }</h2>
               		<p>${ scoreProduct.descript }</p>
                	<div class="org_price">
                    	<del><fmt:formatNumber value="${ scoreProduct.price }"  pattern="#,###" /></del>
                    	<span>${ scoreProduct.discount }%</span>
                  	</div>
                	<div class="dis_price">
                  		<ins><fmt:formatNumber value="${ scoreProduct.price * (1-(scoreProduct.discount/100)) }"  pattern="#,###" /></ins>
                  		<c:choose>
                  			<c:when test="${ scoreProduct.delivery == '0' }">
                  				<span class="free">무료배송</span>
                  			</c:when>
                  			<c:otherwise>
                  				<span class="delivery">배송비 ${ scoreProduct.delivery }</span>
                  			</c:otherwise>
               			</c:choose>
                	</div>
          		</a>
          	</article>
          	</c:forEach>
        </section>
        <!-- new -->
        <section class="new">
        	<h3><span>최신상품</span></h3>
            <c:forEach var="latestProduct" items="${ latestProducts }">
            <article>
              	<a href="/Kmarket1/product/productView.do?prodNo=${ latestProduct.prodNo }">
                	<div class="thumb">
                  		<img src="/Kmarket1/productImg/${ latestProduct.thumb1 }" alt="t1">
                	</div>
                	<h2>${ latestProduct.prodName }</h2>
               		<p>${ latestProduct.descript }</p>
                	<div class="org_price">
                    	<del><fmt:formatNumber value="${ latestProduct.price }"  pattern="#,###" /></del>
                    	<span>${ latestProduct.discount }%</span>
                  	</div>
                	<div class="dis_price">
                  		<ins><fmt:formatNumber value="${ latestProduct.price * (1-(latestProduct.discount/100)) }"  pattern="#,###" /></ins>
                  		<c:choose>
                  			<c:when test="${ latestProduct.delivery == '0' }">
                  				<span class="free">무료배송</span>
                  			</c:when>
                  			<c:otherwise>
                  				<span class="delivery">배송비 ${ latestProduct.delivery }</span>
                  			</c:otherwise>
               			</c:choose>
                	</div>
          		</a>
          	</article>
          	</c:forEach>
        </section>
        <!-- discount -->
        <section class="discount">
            <h3><span>할인상품</span></h3>
            <c:forEach var="discountProduct" items="${ discountProducts }">
            <article>
              	<a href="/Kmarket1/product/productView.do?prodNo=${ discountProduct.prodNo }">
                	<div class="thumb">
                  		<img src="/Kmarket1/productImg/${ discountProduct.thumb1 }" alt="t1">
                	</div>
                	<h2>${ discountProduct.prodName }</h2>
               		<p>${ discountProduct.descript }</p>
                	<div class="org_price">
                    	<del><fmt:formatNumber value="${ discountProduct.price }"  pattern="#,###" /></del>
                    	<span>${ discountProduct.discount }%</span>
                  	</div>
                	<div class="dis_price">
                  		<ins><fmt:formatNumber value="${ discountProduct.price * (1-(discountProduct.discount/100)) }"  pattern="#,###" /></ins>
                  		<c:choose>
                  			<c:when test="${ discountProduct.delivery == '0' }">
                  				<span class="free">무료배송</span>
                  			</c:when>
                  			<c:otherwise>
                  				<span class="delivery">배송비 ${ discountProduct.delivery }</span>
                  			</c:otherwise>
               			</c:choose>
                	</div>
          		</a>
          	</article>
          	</c:forEach>
      	</section>
	</section>
</main>
<jsp:include page="./_footer.jsp"/>