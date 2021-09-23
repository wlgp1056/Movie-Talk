/*게시판 댓글 처리를 위한 객체선언*/

// 댓글 js 모듈이 시작되고 있다.
console.log("Reply Module");
//alert("댓글 모듈 진행...시작");

var replyService = (
	function(){
	
		//댓글 쓰기 함수
		function add(reply, callback){
			//alert("댓글 쓰기 처리 진행...");
			// server에 데이터를 넘겨서 처리 - 브라우저의 URL을 바꾸지 않는다 - Ajax
			$.ajax({
				url:'replyWrite.do',
				type:'post',
				//서버로 보내지는 데이터
				data : reply,
				// 보내지는 데이터의 형식
/*				contentType : "application/json; charset=utf-8",
				success: function(result, status, xhr){
					
				},
				error :function(xhr, status, er){
					alert(status);
					alert(er);
				}*/
				success : function(json){
					callback();
					console.log("성공");
				}
			});
		}
		
		//댓글 수정 함수
		function reply(reply, callback){
			alert("댓글 수정 처리 진행...");
			// server에 데이터를 넘겨서 처리 - 브라우저의 URL을 바꾸지 않는다 - Ajax
			$.ajax({
				url:'modifyReply.do',
				type:'post',
				//서버로 보내지는 데이터
				data : reply,
				success : function(json){
					callback();
					console.log("성공");
				}
			});
		}		
		
		//replyService.add(reply, callback)
		return {
		//키: 데이터 
			add: add,
			reply : reply
		}
	}
	
	
)();