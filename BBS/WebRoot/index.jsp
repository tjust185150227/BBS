<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
BoardDao boardDao = new BoardDaoImpl();
Map mapBoard = boardDao.findBoard();
TopicDao topicDao =new TopicDaoImpl();
UserDao userDao = new UserDaoImpl();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
#apDiv1 {
	position: absolute;
	left: 1px;
	top: 1px;
	width: 1000px;
	height: 50px;
	z-index: 1;
	font-size: 36px;
	text-align: center;
	color: #F33;
}
#apDiv2 {
	position: absolute;
	left: 1px;
	top: 51px;
	width: 1000px;
	height: 25px;
	z-index: 2;
	font-size: 12px;
	color: #004c7d;
	background-color: #e0f0f9;
}
#apDiv3 {
	position: absolute;
	left: 1px;
	top: 76px;
	width: 1000px;
	height: 500px;
	z-index: 1;
	color: #004c7d;
	font-size: 12px;
}
#apDiv4 {
	position: absolute;
	left: 116px;
	top: 104px;
	width: 572px;
	height: 334px;
	z-index: 1;
}
#apDiv5 {
	position: absolute;
	left: 119px;
	top: 51px;
	width: 663px;
	height: 411px;
	z-index: 1;
	color: #FFF;
}
#apDiv6 {
	position: absolute;
	left: 52px;
	top: 135px;
	width: 234px;
	height: 134px;
	z-index: 2;
}
#apDiv7 {
	position: absolute;
	left: 148px;
	top: 252px;
	width: 178px;
	height: 86px;
	z-index: 3;
}
</style>
</head>

<body>
<div id="apDiv1">校园BBS系统</div>
<div id="apDiv2">您尚未<a href="../login.html">登录</a>|<a href="../login.html">注册</a></div>
<div id="apDiv3">
  <table width="1000" border="1" cellspacing="0" cellpadding="0">
    <tr>
      <td colspan="2" align="left" valign="middle">                                                                                      论坛</td>
      <td width="27">主题</td>
      <td width="512">最后发表</td>
    </tr>
    <!-- 主板块 -->
    <%
    List listMainBoard = (List)mapBoard.get(new Integer(0));
    for(int i=0;i<listMainBoard.size();i++){
    	Board mainBoard = ((Board)listMainBoard.get(i));//循环取主板块
     %>
    <tr>
      <td colspan="4"><%=mainBoard.getBoardName()%></td>
    </tr>
    
    <!-- 子板块 -->
    <%
    List listSonBoard = (List)mapBoard.get(new Integer(mainBoard.getBoardId()));
    for(int j=0;j<listSonBoard.size();j++){
    	Board sonBoard = (Board)listSonBoard.get(j);//循环取子板块
    	Topic topic = new Topic();
    	User user = new User();
    	int boardId = sonBoard.getBoardId();
    	List listTopic = topicDao.findListTopic(1,boardId);
    	if(listTopic!=null && listTopic.size()>0){
    		topic = (Topic)listTopic.get(0);
    		user = userDao.findUser(topic.getUid());
    	}
     %>
     <TR class="tr3">
     	<TD width = "5%">&nbsp;</TD>
     	<TH align="left">
     		<IMG src="image/board.gif">
     		<A herf="list.jsp"><%=sonBoard.getBoardName() %></A>
     	</TH>
     	<TD align="center"><%=topicDao.findCountTopic(boardId) %></TD>
     	<TH>
     		<SPAN>
     			<A herf="detail.jsp"><%=topic.getTitle() %></A>
     		</SPAN>
     		<BR/>
     		<SPAN><%=user.getUName() %></SPAN>
     		<SPAN class="gray">[<%=topic.getPublishTime() %>]</SPAN>
     	</TH>
     </TR>
     <%
     		}
     	}
      %>
  </table> 
                                               </div>
</body>
</html>
