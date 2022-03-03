
$(function() {
	
	
	//배송현황 업데이트
	$(".update").click(function() {
		
		var delivery = $("select[name='status']");
		
		
		$ajax({
			type:"post",
			url:"delivery_update",
			data:{
				delivery:delivery
			},
			dataType:"json",
			success: function(data,status,xhr) {
				console.log(data);
				alert("배송현황이 수정되었습니다.");
			},
			error: function(xhr,status,error) {
				console.log(error);
			}
			
		})//ajax end
				
	})//update end
	
	
	
	
	
	
	
})//ready end