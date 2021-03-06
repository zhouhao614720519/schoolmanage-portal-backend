<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.schoolmanage.domain.Checks"%>
<%@page import="com.schoolmanage.domain.Train"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>高校人事管理系统——考核信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/style.css" type="text/css"></link><!-- 因为这边是通过action跳转是webroot下../../css/style.css-->
	<script src="js/common.js"></script>
	<script language="javascript" type="text/javascript">
		function checkScore(obj){
			//判断是否合格
			if(obj.value<60){
				document.getElementById("isqualify").innerHTML="不合格";
			}else{
				document.getElementById("isqualify").innerHTML="合格";
			}
			
		
		}
		function check(){
		  	alert("保存2");
		    document.forms[0].action="${pageContext.request.contextPath}/teachers.do?flag=updateChecks";
		    document.forms[0].submit();	
		 }
	</script>
  </head>
  
  <body>
		<div class="page_title">
			教师管理 &gt; 教师考核管理 &gt; 编辑考核信息
		</div>
		<div class="button_bar">
			<button class="common_button" onClick="help('${pageContext.request.contextPath}/help.html')">
				帮助
			</button>
		
			<button class="common_button" onClick="back();">
				返回
			</button>
			<button class="common_button" onClick="check();">
				保存
			</button>
		</div>
		<br />
		<div class="page_title">
			基本信息:
		</div>
		<%
			//取出岗位信息
			Checks check=(Checks)request.getAttribute("check");
			List<Train> trains=(List<Train>)request.getAttribute("trains");
			
		 %>
		<form id="updateJob" name="update" action="" method="post">
			<input type="hidden" name="tr_id" value="<%=check.getTrain().getId()%>" id="tr_id"/>
			<input type="hidden" name="id" value="<%=check.getId()%>" id="id"/>
			<table class="query_form_table">
				<tr>
					<th>
						员工编号
					</th>
					<td>
						<%=check.getEmp().getEmpno() %>
					</td>
					<th>
						员工姓名
					</th>
					<td>
						<%=check.getEmp().getEmpname() %>
					</td>
				</tr>
				<tr>
					<th>
						培训的编号
					</th>
					<td>
						<%=check.getTrain().getTrno()%>
					</td>
					<th>
						培训主题
					</th>
					<td>						
						<%=check.getTrain().getTitle() %>
					</td>
				
				</tr>
				<tr>
					<th>
						培训内容
					</th>
					<td>
						<textarea name="context" cols="40" rows="5" id="context"><%=check.getTrain().getContext()%></textarea>
					</td>	
					<th>
						是否结束	
					</th>
					<td>
						<%
							if(check.getTrain().isIsend()==true){
								%>
								结束了
						<% 
							}else {							
						 %>
						     没结束
						  <%} %>
					</td>
				</tr>
				<tr>
					<th>
						培训目标
					</th>
					<td>
						<textarea name="goal" cols="40" rows="3" id="goal"><%=check.getTrain().getGoal()%></textarea>
					</td>	
					<th>
						培训要求
					</th>
					<td>
						<textarea name="require" cols="40" rows="3" id="require"><%=check.getTrain().getRequire()%></textarea>	
					</td>
				</tr>
				
			</table>
			<br />
			<div class="page_title">
				考核的详细信息:
			</div>
			<table class="query_form_table" id="table2">
				<tr>
					<th>
						考核的成绩
					</th>
					<td>
						<input type="text" name="score" size="20" value="<%=check.getScore() %>"
							id="score" onchange="checkScore(this);"/>
						
					</td>
					<th>
						是否合格
					</th>
					<td>
						<%
							if(check.isIsqualify()==true){
								%>
								<span id="isqualify">合格</span>
						<% 
							}else {							
						 %>
						     <span id="isqualify">不合格</span>
						<%} %>
						
					</td>
				</tr>
				<tr>
					<th>
						评价
					</th>
					<td>
						<textarea name="judge" cols="40" rows="5" id="judge"><%=check.getJudge()%></textarea>		
					</td>
					<th>
						
					</th>
					<td>
						
					</td>
				</tr>
				
			</table>
		</form>
		
		<table width="100%">
			<tr>
				<td align="right">
					带
					<span class="red_star">*</span>号的为必填项
				</td>
			</tr>
		</table>
	</body>
</html>
