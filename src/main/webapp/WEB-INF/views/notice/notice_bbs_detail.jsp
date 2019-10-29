<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/bbsdetail.css">
<style type="text/css">
.npNotice:hover {
	background-color: #fcf8e3;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="_topBar">
		공지사항
	</div>
	<div id="_tableWrap">
		<table>
			<colgroup><col width="10%"><col width="90%"></colgroup>
			<thead>
				<tr style="height: 70px;">
				<th colspan="2" style="border-bottom:1px solid #DDD0D0;text-align: center; font-size: 30px" id="_titleTh">${dto.title }</th>
				</tr>
			</thead>
			<tbody>
				<tr style="height: 70px">
				<th style="border-bottom:1px solid #DDD0D0;text-align: center;" class="writeTh"><div>작성일</div></th><td style="border-bottom:1px solid #DDD0D0;text-align: left;padding-left: 2%">${fn:substring(dto.wdate,0,10) }</td>
				</tr>
				<tr style="height: 70px">
				<th style="border-bottom:1px solid #DDD0D0;text-align: center;" class="writeTh"><div>작성자</div></th><td style="border-bottom:1px solid #DDD0D0;text-align: left; padding-left: 2%">${dto.id }</td>
				</tr>				
				<tr>
				<td colspan="2" id="_contentTd" style="text-align: center;">${dto.content }</td>
				</tr>
				<tr style="height: 70px">
				<th style="border-bottom:1px solid #DDD0D0;text-align: center;" class="writeTh"><div>첨부파일</div></th>
				<td style="border-bottom:1px solid #DDD0D0;text-align: left; padding-left: 2%">
				<c:choose>
					<c:when test="${empty fileList }">
					첨부파일이 없습니다.
					</c:when>
					<c:otherwise>
					<c:forEach var="i" items="${fileList }">
						<img alt="" src="/image/disk.png" class="disk_img">&nbsp;<a href="#" seq="${i.file_seq }" class="downBtn">${i.originalName }</a>(다운로드:${i.down_count }회)&nbsp;&nbsp;&nbsp;
					</c:forEach>
					</c:otherwise>
				</c:choose>
				</td>
				</tr>
				<tr style="height: 50px">
					<th th style="border-bottom:1px solid #DDD0D0;text-align: center;" class="writeTh"><div>이전글</div>
						<c:choose>
							<c:when test="${not empty previousNotice}">
								<td style="border-bottom:1px solid #DDD0D0;text-align: left; padding-left: 2%" class="npNotice" seq="${previousNotice.seq }">${previousNotice.title }</td>
							</c:when>
							<c:otherwise>
								<td style="border-bottom:1px solid #DDD0D0;text-align: left; padding-left: 2%">이전글이 없습니다.</td>
							</c:otherwise>
						</c:choose>
					</th>
				</tr>
				<tr style="height: 50px">
					<th th style="border-bottom:1px solid #DDD0D0;text-align: center;" class="writeTh"><div>다음글</div>
						<c:choose>
							<c:when test="${not empty nextNotice}">
								<td style="border-bottom:1px solid #DDD0D0;text-align: left; padding-left: 2%" class="npNotice" seq="${nextNotice.seq }">${nextNotice.title }</td>
							</c:when>
							<c:otherwise>
								<td style="border-bottom:1px solid #DDD0D0;text-align: left; padding-left: 2%">다음글이 없습니다.</td>
							</c:otherwise>
						</c:choose>
					</th>
				</tr>				
				<tr height="100px">
					<th colspan="2" id="_btnTh"><button id="_backBtn" type="button">목록</button></th>
				</tr>												
			</tbody>
		</table>
	</div>
	
<script type="text/javascript">
$(".downBtn").on("click",function(){
	/* alert($(this).attr("seq")); */
	var file_seq = $(this).attr("seq");
	location.href = "../common/noticeFileDown.do?file_seq="+file_seq;
})
$("#_backBtn").click(function(){
	history.back();
});
$(".npNotice").click(function() {
	var seq = $(this).attr("seq");
	location.href = "noticeDetail.do?seq="+seq;
});
</script>		
</body>
</html>