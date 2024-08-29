<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/general/setting.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>${dto.title}- 상세정보</title>
<link rel="stylesheet" href="${path}/resources/css/general/header.css">
<link rel="stylesheet" href="${path}/resources/css/general/footer.css">
<link rel="stylesheet" href="${path}/resources/css/general/contents.css">
<link rel="stylesheet" href="${path}/resources/css/general/detail.css">
<script src="${path}/resources/js/details.js"></script>
<script type="text/javascript">
$(function(){
   //댓글목록 자동호출 
   comment_list();
   //1. 댓글쓰기 버튼 클릭
   });
   // 자동으로 댓글목록 호출
      function comment_list() {   // (8)
         var token = $("meta[name='_csrf']").attr("content");
         var header = $("meta[name='_csrf_header']").attr("content");
      
         $.ajax({
            url: '${path}/comment_list.mv',   // 컨트롤러로 이동(9)
            type: 'POST',
            data: 'mvNo=${dto.mvNo}',
            beforeSend: function(xhr){
                xhr.setRequestHeader(header, token);
            },
            // 서버에서 콜백함수 호출 : result는 comment_list.jsp(컨트롤러에서 넘긴)
            success: function(result) {  // (13)
               // div id가 commentList자리에 리스트페이지 출력
               $('#comments').html(result);
            
            },
            error: function() {
               alert('comment_list() 오류');
            }
         });
      }
</script>
</head>
<body>

<header>
<%@ include file="/WEB-INF/views/common/general/header.jsp"%>
</header>
   <div class="wrap">
      
      <div class="movie-detail">
         <fieldset>
         <legend>${dto.title} 상세 설명</legend>
         <table>
            <tr>
               <th rowspan=7>
                  <img src="${dto.poster}" alt="${dto.title}">
               </th>
            </tr>
            
            <tr>
               <th width="400px">감독</th>
               <td>${dto.director}</td>
            </tr>
            
            <tr>
               <th>출연</th>
               <td>${dto.actor}</td>
               
            </tr>
            
            <tr>
               <th>장르</th>
               <td>${dto.genre}</td>
            </tr>
            
            <tr>
               <th>누적관객수</th>
               <td> ${dto.audience}명</td>
            </tr>
            
            <tr>   
               <th>평점</th>
               <td>${dto.grade}</td>
            </tr>
            
            <tr>   
               <th>줄거리</th>
               <td><textarea rows="8" cols="100">${dto.content}</textarea></td>
            </tr>   
         
         </table>
         <input type="hidden"  id="mvNo"  name="mvNo"value="${dto.mvNo}">
      </fieldset>
      </div>
   </div>
 
<form action="${path}/comment_insert.mv" method="post"> 
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">     
      <div class="comment-section">
        <div class="comment-form">
           <h3>감상평을 입력해주세요</h3>
            <input type="text" id="comment" name="review" placeholder="감상평을 입력하세요">
            <select id="rating" name="rating">
                <option value="" disabled selected>별점을 선택하세요</option>
                <option value="★☆☆☆☆">★☆☆☆☆ (1)</option>
                <option value="★★☆☆☆">★★☆☆☆ (2)</option>
                <option value="★★★☆☆">★★★☆☆ (3)</option>
                <option value="★★★★☆">★★★★☆ (4)</option>
                <option value="★★★★★">★★★★★ (5)</option>
            </select>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요">
            <input type="hidden"  id="mvNo"  name="mvNo"value="${dto.mvNo}">
            <button type="submit" id="btnCommentSave">감상평 등록</button>
        </div>
       </div>
</form>
        <div id="comments"></div>
        <div class="pagination" id="pagination"></div>

<footer>
<%@ include file="/WEB-INF/views/common/general/footer.jsp"%>
</footer>
</body>
</html>