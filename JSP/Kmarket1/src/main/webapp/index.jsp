<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
<jsp:include page="./_menu.jsp"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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
              <li>
                <a href="#">
                  <div class="thumb">
                    <i>1</i>
                    <img src="https://via.placeholder.com/230" alt="item1">
                  </div>
                  <h2>상품명</h2>
                  <div class="org_price">
                    <del>30,000</del>
                    <span>10%</span>
                  </div>
                  <div class="dis_price">
                    <ins>27,000</ins>
                  </div>
                </a>
              </li>
              <li>
                <a href="#">
                  <div class="thumb">
                    <i>2</i>
                    <img src="https://via.placeholder.com/50" alt="item1">
                  </div>
                  <article>
                    <h2>상품명</h2>
                    <div class="org_price">
                      <del>30,000</del>
                      <span>10%</span>
                    </div>
                    <div class="dis_price">
                      <ins>27,000</ins>
                    </div>
                  </article>
                </a>
              </li>
              <li>
                <a href="#">
                  <div class="thumb">
                    <i>3</i>
                    <img src="https://via.placeholder.com/50" alt="item1">
                  </div>
                  <article>
                    <h2>상품명</h2>
                    <div class="org_price">
                      <del>30,000</del>
                      <span>10%</span>
                    </div>
                    <div class="dis_price">
                      <ins>27,000</ins>
                    </div>
                  </article>
                </a>
              </li>
              <li>
                <a href="#">
                  <div class="thumb">
                    <i>4</i>
                    <img src="https://via.placeholder.com/50" alt="item1">
                  </div>
                  <article>
                    <h2>상품명</h2>
                    <div class="org_price">
                      <del>30,000</del>
                      <span>10%</span>
                    </div>
                    <div class="dis_price">
                      <ins>27,000</ins>
                    </div>
                  </article>
                </a>
              </li>
              <li>
                <a href="#">
                  <div class="thumb">
                    <i>5</i>
                    <img src="https://via.placeholder.com/50" alt="item1">
                  </div>
                  <article>
                    <h2>상품명</h2>
                    <div class="org_price">
                      <del>30,000</del>
                      <span>10%</span>
                    </div>
                    <div class="dis_price">
                      <ins>27,000</ins>
                    </div>
                  </article>
                </a>
              </li>
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
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item5"></a>
                        </li>
                        <li style="float: left; list-style: none; position: relative; width: 985px;" aria-hidden="true">
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item1"></a>
                        </li>
                        <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 985px;">
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item2"></a>
                        </li>
                        <li aria-hidden="true" style="float: left; list-style: none; position: relative; width: 985px;">
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item3"></a>
                        </li>
                        <li aria-hidden="true" style="float: left; list-style: none; position: relative; width: 985px;">
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item4"></a>
                        </li>
                        <li style="float: left; list-style: none; position: relative; width: 985px;" aria-hidden="true">
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item5"></a>
                        </li>
                        <li style="float: left; list-style: none; position: relative; width: 985px;" class="bx-clone" aria-hidden="true">
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item1"></a>
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
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
          </section>
          <!-- recommend -->
          <section class="recommend">
            <h3><span>추천상품</span></h3>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span>배송비 2500</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span>배송비 2500</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span>배송비 2500</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span>배송비 2500</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span>배송비 2500</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span>배송비 2500</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span>배송비 2500</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span>배송비 2500</span>
                </div>
              </a>
            </article>
          </section>
          <!-- new -->
          <section class="new">
            <h3><span>최신상품</span></h3>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
          </section>
          <!-- discount -->
          <section class="discount">
            <h3><span>할인상품</span></h3>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
            <article>
              <a href="#">
                <div class="thumb">
                  <img src="https://via.placeholder.com/230x230" alt="t1">
                </div>
                <h2>상품명</h2>
                <p>간단한 상품 설명</p>
                <div class="org_price">
                  <del>30,000</del>
                  <span>10%</span>
                </div>
                <div class="dis_price">
                  <ins>27,000</ins>
                  <span class="free">무료배송</span>
                </div>
              </a>
            </article>
          </section>
    </section>
</main>
<jsp:include page="./_footer.jsp"/>