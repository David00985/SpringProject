

function cloneImg() {
	console.log("함수호출~");
	var image = $("#cloneImg1");
	var span = $("#clone");
	var cloneimg = image.clone();// 이미지 복사후
	span.append(cloneimg);//span에 이미지 추가
	span.addClass("active");//class추가

	setTimeout(function() {
		span.removeClass("active");//class제거
		span.empty();//span 비우기.. 
	}, 750);
	console.log("시간끝");
}


	$(function() {
		
		
		//1. 배경이미지 교체 
		$(".small-img").on("mouseover", function() {			
			$("#ProductImg").attr("src", $(this).attr("src"));
		});//end change
		
		//2. add to cart 버튼 누르면 로그인검사, 사이즈 색깔 검사 후에 ajax로 추가하기
		$(".btn").click(function() {
			//특이점 null값이 string으로 넘어온다 즉 비교를 "null"이랑 해야한다. 
			var loginCheck = $(this).attr("data-login");
			
			if ($("#gsize").val()=="Select Size") {
				alert("사이즈를 선택해주세요");
				
			}else if ($("#gcolor").val()=="Select Color") {
				alert("색상을 선택해주세요.");
				//특이점!!
			}else if(loginCheck == "null" ){
				alert("로그인이 필요한 기능입니다.");
				location.href ="loginForm";
			}else{		
				// ajax로 장바구니에 추가하기~~~~~
				var gid = $(this).attr("data-id");
				var csize = $("#gsize").val();
				var gcolor = $("#gcolor").val();
				var cqty =$("#cqty").val();
				
				console.log(gid +" " + csize+" " + gcolor+" " + cqty);
				
				//ajax부분
				$.ajax({
					url:"cartAdd",
					type:"post",
					datatype:"text",
					data: 
						{gid :gid, 
						csize :csize, 
						gcolor :gcolor, 
						cqty :cqty}
					,
					success: function(data, status , xhr  ) {
					
						if( data =="success"){
							alert("장바구니에 추가되었습니다.");
						}else if(data =="failed"){
							alert("장바구니에 추가 실패");
						}else{
							alert("예상못한 에러");
						}
						
						//카트로 이미지 복제후 이동하기~~
						
						cloneImg();
						
					
					},
					error: function(xhr , status , error  ) {
						console.log(error);
					}
				});		
				
			
			}
		})//end 2. add to cart btn click
		
		
		//3. 
		
		
		
		
		
		
	});//end ready

