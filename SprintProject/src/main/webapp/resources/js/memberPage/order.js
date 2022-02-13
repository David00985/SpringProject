

// 여기부터 주소 api~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// <!-- parser-blocking via document.writhe 관련 문제 해결 방법 -->

// <!-- 주신 링크로 들어가보니 cross site 이슈에 대한 답변이 있었습니다. 
// 두번째의 경우 저희 API의 기본적인 로딩 방식은 postcode.v2.js 파일을 불러올때 코어스크립트의 로딩 동기화를 위해 document.write방식을 사용하고 있습니다.
//  바로 이점 때문에 나오는 경고 메세지인데요. document.write의 경우 페이지가 순차적으로 렌더링 되다가 이 로직을 만나면 블락이 되고 이 부분이 
//  모두 완료되기 전까진 페이지 로딩 맟 파싱이 정지됩니다. 그래서 poor network coonnectivity 라는 부분처럼, 느린 네트워크 환경에서 document.write를 
//  통해 이용하면 페이지가 멈춘것처럼 보여 서비스 장애처럼 보이니 주의하라는 것인데요.
// 이것에 대한 해결책은 두가지가 있습니다.
// 저희 가이드 페이지의 동적로딩 방식을 이용한다 (가이드 페이지 기본 사용법 참고)
// < / b o d y > 바로 위에 script src=postcode.v2.js를 넣는다. 이 방식은 보통 서비스 개발시 통상적으로 head에 스크립트 로딩을 넣는 것으로 알려주는데요,
//  이것은 document.write가 아니더라도 부르는 스크립트 수가 늘어나면 페이지가 좀 늦게 뜨게 됩니다. 그래서 이에 대한 트릭으로, 스크립트 로딩이나 사전 
//  프로세싱이 필요한 것들은 < / b o d y > 바로 앞, 즉 페이지의 맨 하단에 위치시키는데요. 이 경우 본문 페이지는 페이지대로 로딩이 다 되고 스크립트의 
//  경우에는 보통 DOM처리때문에 모든 다큐먼트가 파싱된 이후에 처리하는게 기본이므로, 페이지 렌더링 흐름이 자연스럽게 연결이 됩니다. 다만 애초에 페이지 
//  설계를 이렇게 하지 않고 중간중간 스크립트를 삽입하여 비지니스 로직을 설계하셨다면 안맞는 방법일 수도 있습니다. -->

// <!--?autoload=false 이거랑  daum.postcode.load(function(){ 이걸 추가하니까  정상적으로 해결됬다. -->

function sample4_execDaumPostcode() {
	daum.postcode.load(function() { // 추가 부분
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

								// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
								var extraRoadAddr = ''; // 도로명 조합형 주소 변수

								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraRoadAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraRoadAddr += (extraRoadAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraRoadAddr !== '') {
									extraRoadAddr = ' (' + extraRoadAddr + ')';
								}
								// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
								if (fullRoadAddr !== '') {
									fullRoadAddr += extraRoadAddr;
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('mpost').value = data.zonecode; //5자리 새우편번호 사용
								document.getElementById('maddress1').value = fullRoadAddr;
								document.getElementById('maddress2').value = data.jibunAddress;

								// 이부분도 null포인트 익셉션 에러가 났는데 그냥 주석처리했다. 
								// // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
								// if(data.autoRoadAddress) {
								//     //예상되는 도로명 주소에 조합형 주소를 추가한다.
								//     var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
								//     document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

								// } else if(data.autoJibunAddress) {
								//     var expJibunAddr = data.autoJibunAddress;
								//     document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

								// } else {
								//     document.getElementById('guide').innerHTML = '';
								// }
							}
						}).open();
			});
}//end sample4_execDaumPostcode




const cradit = document.querySelector("#cradit");
const account = document.querySelector("#account");

const multi_1 = document.querySelector(".multi-1");
const multi_2 = document.querySelector(".multi-2");


cradit.addEventListener("click" , function () {
  multi_2.style.display="none"
  multi_1.style.display="block"
});

account.addEventListener("click" , function () {
  multi_2.style.display="block"
  multi_1.style.display="none"
});






//제이쿼리 
$(function(){

	// 쿠폰 있을때, 없을때 상품 총합 
	function count() {
		var total = parseInt($("#subtotal").text());
		
		code = $("#discount-token").val();
		// 할인쿠폰이 없으면. 
		if(code ==""){
			
			//원상복구
			$("#tax").css({"color":"black","text-decoration":"none" });
			$("#total").text(total);
			$("#payAmount1").text(total);
			$("#payAmount2").text(total);
			$("#payAmount3").text(total);
			$("#shipping").text("0").css("color", "black");
			$("#subtotal").css({"color":"black","text-decoration":"none" });
			$("#shippingContent").text("");
		// 할인쿠폰이 있으면			
		}else{
			
			var type =  $("#couponDiv").attr("data-type");
			var discount =  $("#couponDiv").attr("data-discount");
			var content = $("#couponDiv").attr("data-content");
			console.log(type , discount);
			
			if( type == "delivery"){
				$("#tax").css({"color":"red","text-decoration":"line-through" });
				$("#shipping").text("3000").css("color", "blue");
				$("#total").text(total-3000);
				$("#payAmount1").text(total-3000);
				$("#payAmount2").text(total-3000);
				$("#payAmount3").text(total-3000);
				$("#subtotal").css({"color":"red","text-decoration":"line-through" });
				$("#shippingContent").text("(" + content + ")");
			}else if( type == "total"){
				total += 3000;
				var rate = 100 - parseInt(discount);
				var totalPrice = total * rate / 100;
				var discountPrice = totalPrice - total;
				
				$("#tax").css({"color":"black","text-decoration":"none" });
				$("#total").text(totalPrice);
				$("#payAmount1").text(totalPrice);
				$("#payAmount2").text(totalPrice);
				$("#payAmount3").text(totalPrice);
				$("#shipping").text(discountPrice).css("color", "blue");
				$("#subtotal").css({"color":"red","text-decoration":"line-through" });
				$("#shippingContent").text("(" + content + ")");
			}else{
				alert("예상치 못한 에러");
			}
			
			
		}//end 할인쿠폰 유무 분기 
				
	};
	
	// 쿠폰 있으면 등록중, 없으면 등록하기 나오게 하는 함수 
	function couponStatus() {
		code = $("#discount-token").val();
		if( code != ""){
			var type = $("#couponDiv").attr("data-type");
			$("#couponStatus").text("쿠폰 등록중(" + type + ")" );
		}else{
			$("#couponStatus").text("쿠폰 등록하기");
		}
		
	}
	
	couponStatus();
	count();
	
//이벤트 시작
	
	//1. 쿠폰 제거 하기
	$("#couponOut").on("click", function() {
		
		// 1.1 input 비우기 , readonly 제거하기 
		$("#discount-token").removeAttr("readonly").val("");
		// 1.2 couponDiv data값4 개 다 x로 바꾸기
		$("#couponDiv").attr("data-code", "x");
		$("#couponDiv").attr("data-type", "x");
		$("#couponDiv").attr("data-content", "x");
		$("#couponDiv").attr("data-discount", "x");
		
		
		// 1.3 제거 버튼 사라지고 등록 버튼 나오게 하기 
		$(this).css("display", "none");
		$("#couponIn").css("display", "block");
		
		// 1.4 계산하기 
		couponStatus();
		count();
		
		// 1.5 세션에서 쿠폰 제거하기 -> ajax로 세션 제거하기로 변경
		
	});// end 1. 쿠폰 제거하기 
	
	//2. 쿠폰 등록하기 
	// 쿠폰 정책은 회사내규에 따른것. 여기서는 간단하게 쿠폰은 선착순 으로 쓰면 효력이 정지
	//되게 하는것으로 결정.  쿠폰은 다음의 절차를 가지고 ajax로 작성한다. 
	$("#couponIn").on("click", function() {
		var dccode = $("#discount-token").val();
		
		// 0. 코드가 빈칸이다. 
		if( dccode =="" ){
			console.log("비었다");
		}else{
			//1. 할인코드를 ajax로 넘기기. 
			//ajax부분
			$.ajax({
				url:"loginCheck/coupon",
				type:"post",
				datatype:"json",
				data: 
					{ dccode :dccode}
				,
				success: function(data, status , xhr  ) {
					var errorCode ="";
					if ( data.code == "failed"){
						errorCode ="코드를 잘못 입력했습니다.";
					}else if( data.code =="TXerror"){
						alert("tx오류");
					}else if( data.code == "failed2"){
						errorCode ="모두 사용해서 등록하수 없는 쿠폰입니다.";
					}else if( data.code == "used"){
						errorCode ="이미 사용한 쿠폰입니다.";
					}else if(data.code == "test"){
						//이게 나오면 버그 있음 						
						alert("에러");
					}else{
						// 정상적으로 서버에서 데이터를 받았다. <-~~~~~~~
						
						console.log(data.code , data.content , data.type , data.discount);
						//1. div에 쿠폰 정보 등록하기 
						$("#couponDiv").attr("data-code", data.code);
						$("#couponDiv").attr("data-type", data.type);
						$("#couponDiv").attr("data-content", data.content);
						$("#couponDiv").attr("data-discount", data.discount);
						
						//2. input에 값넣기 , readonly로 바꾸기
						$("#discount-token").val(data.code).attr("readonly","readonly");
						
						//3. 등록 버튼 제고, 제거버튼 나오게하자. 
						$("#couponIn").css("display", "none");
						$("#couponOut").css("display", "block");
						
						//4. 함수 불러서 값계산하기 
						couponStatus();
						count();
						
						//5. 세션에 쿠폰 등록하기 
						
						
						
					}//end success 분기... 
					if(errorCode !="" ){
						$("#couponStatus").text("쿠폰 등록하기 (" + errorCode + ")");
					}
					
				},
				error: function(xhr , status , error  ) {
					console.log(error);
				}
			});	//end ajax 	
			
		}//end dccode 아무것도 입력안한경우 
		
	});//end 2. apply 쿠폰버튼
	
	
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	
	
	
	
	
	
	
	
	
	
	//3. submit시 공백 검사 및  단계별 ajax async await 
	$("form").on("submit", function() {
		event.preventDefault();
		code = $("#couponDiv").attr("data-code");
		//1. 공백검사. 
		
		
		
		
		// 2. promise 비동기 연습  multi ajax 검증 하기.. 
		// 1. 유저id 검증 
		
		
		
		//1. 쿠폰없을때 promise체인
		if(code == "x"){
			//1. 유저 아이디 검증
			UserInfoPromise()
			.then(function(result) {
				console.log("userInfoPromise.then:" , result);
			})
			//3. 제고 검증
			.then(function(result4) {
					
			})
			.catch(function(err) {
					alert( err);		
			})
			
			
			
		}
		//2. 쿠폰 있을때 promise체인
		else{
			//1. 유저 아이디 검증
			UserInfoPromise()
			.then(function(result) {
				console.log("userInfoPromise.then:" , result);
				return couponPromise();
			})
			//2. 쿠폰 검증 
			.then(function(result4) {
				console.log("couponPromise .then:" , result4);	
			})
			//3. 제고 검증
			.catch(function(err) {
					alert( err);		
			})
			
			
			
		}
		
		
	
		
		
		
		
		
		
		
		
	});//end 3. submit시 공백 검사 및  단계별 ajax async await 
	
	
	
	
	
	
	
	
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	
	//promise1. 유저아이디 검증 
	function UserInfoPromise() {
		return new Promise(function(resolve, reject) { 
			
			$.ajax({
				url:"loginCheck/userInfoAjax",
				type:"post",
				datatype:"text",
				
				success: function(data, status , xhr  ) {
						
					if( data == "success"){
						resolve(data);
					}else{
						reject("없는 id입니다.");
					}	
				
				},
				error: function(xhr , status , error  ) {
					console.log("userinfopromise:" +error);
					
				}
			});	//end ajax 	
			
		});
	}//end UserInfoPromise
	
	
	//promise2. 쿠폰 검증
	function couponPromise() {
		return new Promise(function(resolve, reject) { 
			
		
			code = $("#couponDiv").attr("data-code");
			$.ajax({
				url:"loginCheck/couponPromise",
				type:"post",
				datatype:"text",
				data: 
					{ code :code}
				,
				success: function(data, status , xhr  ) {
					
					console.log("userinfoajax:"+data);
							
					if( data == "success"){
						resolve(data);
					}else if(data == "failed"){
						reject("사용할수 없는 쿠폰 입니다.");
					}else if (data == "used"){
						reject("이미 사용한 쿠폰입니다.")
					}else{
						alert("쿠폰프로미스 버그~~");
					}	
					
				},
				error: function(xhr , status , error  ) {
					console.log("couponPromise:" +error);
						
				}
			});	//end ajax 	
		
			
			
			
		});
	}// end couponPromise
	
	
	
	
	
	
	
	
	
});//end ready 




