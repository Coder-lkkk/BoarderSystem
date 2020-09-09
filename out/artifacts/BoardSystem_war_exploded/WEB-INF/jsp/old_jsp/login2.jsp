<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
  <style type="text/css">
         #header{
            background-image: url("<%=basePath%>/images/login.jpg");
            background-size: 100%;
            height: 240px;
        }
        #code{
            font-family:Arial;
            font-style:italic;
            font-weight:bold;
            letter-spacing:2px;
            color: #393D49;
            width: 70px;
        }
        #content{
            width:40%;
            margin: 6% 30% 0 30%;
            height: 53%;
        }
    </style>
    <script>
// 判断是登录账号和密码是否为空
function check(){
    var adm_name = $("#adm_name").val();
    var adm_password = $("#adm_password").val();
    if(adm_name=="" || adm_password==""){
    	$("#message").text("账号或密码不能为空！");
        return false;
    }  
    return true;
}
</script>
  </head>
  
  <body>
  <div class="header">
           <div style="height:15%;width:100%;background:#708090;text-align:center;">
            <div>&nbsp;<img style="height:100%;" src="<%=basePath%>/images/logo.png" /></div>
        </div>
  </div>
    <div class="container">
    <div id="content">
        <h2 class="text-nowrap" style="color: #393D49;text-align:center;padding-top:10%;font-family: Menlo">BS论坛</h2>
        <div style="text-align: center;">
            <br/>
            <br/>
            <label style="font-size:20px;color:white;padding-right:8%;">
                <a href="#" id="login" style="text-decoration: none;border-bottom:2px solid #009688;color:#009688">账号密码登录</a>
            </label>

            <label style="font-size:20px;color:white;padding-left:8%;">
                <a href="#" id="quickLogin" style="text-decoration: none">扫码登录</a>
            </label>
        </div>
        <hr style="color: #484848;text-align:center;"/>
        <!-- 账号密码登录的表单 -->
           <form action="<%=basePath%>/login.action" id="loginForm" method="post" onsubmit="return check()" class="layui-form" style="text-align: center;margin-right:12%;margin-top:10%;">
            <font color="red">
			    <%-- 提示信息--%>
			    <span id="message">${msg}</span>
		    </font>
            <div>
                <div class="layui-form-item layui-inline" style="width:110%">
                    <label class="layui-form-label" style="margin-left:13%;"><i class="fa fa-user fa-fw"></i></label>
                    <div class="layui-input-inline">
                        <input type="text" name="adm_name" class="layui-input" style="border-bottom:1px solid white;width: 160px" placeholder="Username"/>
                    </div>
                </div>
                <br/>
                <div class="layui-form-item layui-inline">
                    <label class="layui-form-label">
                        <span class="fa fa-lock fa-fw"></span>
                    </label>
                    <div class="layui-input-inline">
                        
                    <input type="password" name="adm_password" class="layui-input" style="border-bottom:1px solid white; width: 160px" placeholder="Password"></div>
                </div>
                <br/>
                <br/>
                <div style="text-align:center;color: #009688;background-color: #01AAED;width:48%;margin-left:138px;">
                    <input id="sign"type="submit" class="layui-btn layui-btn-lg" style="background: none;" value="Sign in"/>
                </div>
            </div>
        </form>
        <!-- 快捷登录的表单 -->
        <form  id="quickLoginForm" method="post" class="layui-form" hidden="hidden" style="text-align: center;margin-right:12%;margin-top:10%;">
           <div><img src="<%=basePath%>/images/QRcode.png"/></div>
        </form>
    </div>
</div>
  </body>
  <script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<script type="text/javascript">
    layui.use(['layer','element'], function(){
        var layer = layui.layer;
        var element = layui.element;
    });
    $("#quickLogin").click(function(){
        $("#login").css({'border':'none','color':'#393D49'});
        $(this).css({'border-bottom':'2px solid #009688','color':'#009688'});
        $("#loginForm").hide();
        $("#quickLoginForm").show();
    });
    $("#login").click(function(){
        $("#quickLogin").css({'border':'none','color':'#393D49'});
        $(this).css({'border-bottom':'2px solid #009688','color':'#009688'});
        $("#quickLoginForm").hide();
        $("#loginForm").show();
    });
    </script>
</html>
