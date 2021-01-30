<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<link href="/resources/css/faqC.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section>
        <div class="faq">
            <div>
                <h1>자주 묻는 질문</h1>
                <span>찾으시는 질문이 없다면?</span>
                <button id="qna">1:1 문의하기</button>
            </div>
            <div class="navi">
                <ul>
                    <li><a href="javascript:void(0)" value="all">전체</a></li>
                    <li><a href="javascript:void(0)" value="member">회원가입/정보</a></li>
                    <li><a href="javascript:void(0)" value="order">결제/배송</a></li>
                    <li><a href="javascript:void(0)" value="cancel">취소/교환/반품</a></li>
                </ul>
            </div>
            <div class="que">
                <div class="member">
                    <div class="ask">
                        <span>회원가입/정보</span>
                        <p>회원 정보를 변경하고 싶어요</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">오른쪽 상단 [로그인] → [마이페이지] → 내정보 → 변경하기 누르고 정보를 변경하시면 됩니다.</div>
                    </div>
                    <div class="ask">
                        <span>회원가입/정보</span>
                        <p>해외에 살고 있는데 회원가입 할 수 있나요?</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">휴대폰으로 본인 인증을 하실 수 있으면 가입하실 수 있습니다. 하지만 해외 배송은 불가능한 점 말씀드립니다.</div>
                    </div>
                    <div class="ask">
                        <span>회원가입/정보</span>
                        <p>외국인도 주문할 수 있나요?</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">국내에서 개통하신 명의의 휴대폰으로 인증하여 가입이 가능합니다. 또한 국내 배송지로 주문하신다면 배송도 가능합니다.</div>
                    </div>
                    <div class="ask">
                        <span>회원가입/정보</span>
                        <p>아이디를 잃어버렸어요. 어떻게 찾을 수 있나요?</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">오른쪽 상단 [로그인] → 하단에 [아이디 찾기] 누르고 회원님의 성함 및 가입하신 전화번호 입력하고 아이디를 찾으시면 됩니다.</div>
                    </div>
                    <div class="ask">
                        <span>회원가입/정보</span>
                        <p>비밀번호를 잃어버렸어요. 어떻게 찾을 수 있나요?</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">오른쪽 상단 [로그인] → 하단에 [아이디 찾기] 누르고 회원님의 성함 및 가입하신 전화번호 입력하고 아이디를 찾으시면 됩니다.</div>
                    </div>
                    <div class="ask">
                        <span>회원가입/정보</span>
                        <p>비회원도 구매 가능한가요?</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">주류 제품이기 때문에 성인 인증을 거친 회원님만 구매하실 수 있는 점 양해 부탁드립니다.</div>
                    </div>
                </div>
                <div class="order">
                    <div class="ask">
                        <span>결제/배송</span>
                        <p>언제 배송 시작되나요?</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">오후 2시 이전까지 결제 완료해주신 주문 건들은 당일 출고해드리며 그 이후 주문은 익일 출고해드립니다. ※명절 등 물량이 많은 시즌에는 다소 지체될 수 있음을 알려드립니다.</div>
                    </div>
                    <div class="ask">
                        <span>결제/배송</span>
                        <p>어떤 결제 방법을 지원하나요?</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">술자리에서는 카드 결제만 지원합니다.</div>
                    </div>
                    <div class="ask">
                        <span>결제/배송</span>
                        <p>대량 구매도 가능한가요?</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">일반적인 온라인 결제로도 많은 수량의 제품 구매가 가능하며 더 자세한 문의가 필요하시면 1:1 문의를 이용해주세요.</div>
                    </div>
                </div>
                <div class="cancel">
                    <div class="ask">
                        <span>취소/교환/반품</span>
                        <p>주문 취소가 가능한가요?</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">네 가능합니다. 1. 구독 상품의 경우, 오른쪽 상단 [로그인] → [마이페이지] → 구독 메뉴에서 구독중인 상품을 확인 후 “구독 취소하기” 버튼을 누르시면 됩니다. 2. 일반 상품의 경우, 오른쪽 상단 [로그인] → [마이페이지] → 주문 내역에서 주문 취소 하고 싶은 상품을 확인 후 "주문 취소" 버튼을 누르시면 됩니다.</div>
                    </div>
                    <div class="ask">
                        <span>취소/교환/반품</span>
                        <p>교환/반품 기준이 어떻게 되나요?</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">[단순변심/ 주문 오류의 경우] 신선식품인 술이 포함되어 단순변심 교환/반품을 받지 않습니다. [상품에 문제가 있는 경우] 문제가 있는 부분을 사진 찍어 1:1 문의에 남겨주시면 친절하게 안내해 드리겠습니다!</div>
                    </div>
                    <div class="ask">
                        <span>취소/교환/반품</span>
                        <p>환불을 받았는데 포인트가 들어오지 않았어요</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">포인트 지급이 지연될 수 있습니다. 하루 후에도 포인트가 지급되지 않는다면 1:1 문의에 남겨주시기 바랍니다.</div>
                    </div>
                    <div class="ask">
                        <span>취소/교환/반품</span>
                        <p>술이 깨져서 왔어요</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">죄송합니다. 금일 동일한 제품, 수량으로 빠르게 재발송 도와드리겠습니다. 제품과 주문해주신 내역 확인을 위해, 깨진 제품 사진 촬영 후 1:1 문의를 이용해주시면 빠르게 해결해드리도록 하겠습니다. 번거롭게 해드려 죄송합니다.</div>
                    </div>
                    <div class="ask" style="border: none;">
                        <span>취소/교환/반품</span>
                        <p>주문한 제품과 다른 제품이 왔어요</p>
                        <img src="/resources/image/arrowd.png">
                        <div class="content">죄송합니다. 포장 과정에서 착오가 있었던 것 같습니다. 고객님의 주문 건 확인을 위해 1:1 문의 게시판을 이용해주시면 바로 도와드리겠습니다. 번거롭게 해드려 죄송합니다.</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script>
        $(function(){
            $(".content").hide();
            $(".navi a").click(function(){
                $(".navi a").removeClass("select");
                $(this).addClass("select");
                $(".que>div").hide();
                var index = $(".navi a").index(this);
                if(index == 0){
                    $(".que>div").show();
                }else{
                    $(".que>div").eq(index-1).show();
                }
            });
            $(".ask").click(function(event){
                $(this).find($(".content")).slideToggle(500);
                event.stopPropagation();
            });
            $(".navi a").eq(0).click();
            $("#qna").click(function(){
               location.href="/client/mQuestion.sool?reqPage=1&period=1";//문의하기 작성하는 페이지 
            });
        });
    </script>
</body>
</html>