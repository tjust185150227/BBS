<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
	TopicDao topicDao = new TopicDaoImpl();
	ReplyDao replyDao = new ReplyDaoImpl();
	UserDao userDao = new UserDaoImpl();
	
	int boardId=9;
	int p=1;
	List listTopic = topicDao.findListTopic(p,boardId);
 %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	left: 9px;
	top: 2px;
	width: 800px;
	height: 50px;
	z-index: 1;
	text-align: center;
	font-size: 36px;
}
#apDiv1 {
	color: #06F;
}
#apDiv2 {
	position: absolute;
	left: 9px;
	top: 52px;
	width: 800px;
	height: 25px;
	z-index: 2;
	font-size: 12px;
	color: #004c7d;
	background-color: #e0f0f9;
}
#apDiv3 {
	position: absolute;
	left: 10px;
	top: 84px;
	width: 819px;
	height: 25px;
	z-index: 3;
}
#apDiv4 {
	position: absolute;
	left: 1px;
	top: 122px;
	width: 809px;
	height: 104px;
	z-index: 4;
}
#apDiv5 {
	position: absolute;
	left: 2px;
	top: 119px;
	width: 801px;
	height: 38px;
	z-index: 4;
}
#apDiv6 {
	position: absolute;
	left: 10px;
	top: 114px;
	width: 805px;
	height: 449px;
	z-index: 4;
}
</style>
</head>

<body>
<div id="apDiv1">校园BBS系统</div>
<div id="apDiv2">您尚未<a href="login.html">登录</a> or <a href="reg.html">注册</a></div>
<div id="apDiv3">&gt;&gt;&gt;&gt;<a href="index.html">论坛首页</a>&gt;<a href="list.html">灌水乐园</a></div>
<div id="apDiv6">
  <form id="form1" name="form1" method="post" action="">
    <input name="发表话题" type="submit" id="发表话题" value="发表话题" />
  </form>
  <p>上一页|下一页</p>
  <table width="807" height="283" border="1" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td>&nbsp;</td>
      <td align="center">文章</td>
      <td align="center">作者</td>
      <td align="center">回复</td>
    </tr>
    <%
    	for(int i=0;i<listTopic.size();i++){
    	Topic topic = (Topic)listTopic.get(i);//循环取得主题对象
    	User user = userDao.findUser(topic.getUid());//取得该主题的发布用户
     %>
    <tr>
      <td width="50">&nbsp;</td>
      <td width="612">1</td>
      <td width="68" align="center">user1</td>
      <td width="67" align="center">0</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>2</td>
      <td align="center">user2</td>
      <td align="center">2</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>3</td>
      <td align="center">user1</td>
      <td align="center">4</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>4</td>
      <td align="center">user1</td>
      <td align="center" valign="middle">5</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>5</td>
      <td align="center">user2</td>
      <td align="center">0</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>6</td>
      <td align="center">user2</td>
      <td align="center">0</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>7</td>
      <td align="center">user1</td>
      <td align="center">0</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>8</td>
      <td align="center">user1</td>
      <td align="center">0</td>
    </tr>
    <%
    	}
     %>
  </table>
  <p>上一页|下一页</p>
</div>
<p>&nbsp;</p>
</body>
</html>