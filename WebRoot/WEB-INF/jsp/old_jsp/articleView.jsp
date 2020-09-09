 <%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	language="java"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	String nowDate = sdf.format(date);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'articleView.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div class="container" style="width:80%;">
    <br/>
    <br/>
    <!-- 文章标题概要 -->
    <h2><center>『 ${article.art_summary} 』</center></h2>
    <br/>
    <!-- 添加Markdown的容器 -->
    <div id="content" style="height: 150px; ">
        <lable style="background-color: #ddd; width:100%; font-size:20px;">">${article.art_content}</lable>
    </div>
    <hr style="height: 3px;border: none;background-color:
#B0C4DE;background-image: repeating-linear-gradient(-45deg, #fff, #fff 4px, transparent 4px, transparent 8px);"/>
    <div style="border-left: 3px solid #f44336;">
        <br/>
        
         <div style="margin-bottom:8px;">
             &nbsp;&nbsp;&nbsp;&nbsp;<lable style="font-size:12px;">本文作者：&nbsp;&nbsp;</lable>
             <span style="font-size:12px;">${article.art_author}</span>
         </div>

        <div style="margin-bottom:8px;">
            &nbsp;&nbsp;&nbsp;&nbsp;<lable style="font-size:12px;">发表时间：&nbsp;&nbsp;</lable>
            <span style="font-size:12px;">${article.art_date}</span>
        </div>

        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;<lable style="font-size:12px;">版权声明：&nbsp;&nbsp;</lable>
            <span style="font-size:12px;">本贴所有解释权归<strong>lkkk</strong>所有</span>
        </div>
        <br/>
    </div>

    <div style="margin:0 4% 0 4%;"></div>
        <br/>     
    <div style="margin:0 4% 0 4%;"></div>
        <br/>
        <!-- 留言的表单 -->
        <form class="layui-form" action="<%=basePath%>/article/saveWords.do" method="post">
            <input name="lw_name" value="${sessionScope.article.art_name}" hidden="hidden"/>
            <input name="lw_date" value="<%=nowDate%>" hidden="hidden"/>
            <input name="lw_article_id" value="${article.art_id}" hidden="hidden"/>
            <div class="layui-input-block" style="margin-left: 0;">
                <textarea id="lw_content" name="lw_content" placeholder="请输入你的看法" class="layui-textarea" style="height: 100px; width: 70% "></textarea>
            </div>
            <div class="layui-input-block" style="text-align: left;margin-left: 0;">
                <input type="submit" class="layui-btn" value="发表">
            </div>
        </form>
        <!-- 显示留言 -->
       <c:forEach items="${requestScope.lm_list}" var="words">                     
                        <li style="border-top: 1px dotted #01AAED">
                            <br/>
             <div style="text-align: left;margin-left:61px;color: #444">
                 <div>
                      <span style="color:#5FB878">${words.lm_name}&nbsp;&nbsp;</span>
                 </div>
             <div>${words.lm_content}</div>
			 </div>
            <div>
             <div class="comment-parent" style="text-align:left;margin-top:7px;margin-left:61px;color:#444">
                     <span>${words.lm_date}</span>
                     &nbsp;&nbsp;&nbsp;&nbsp;
             </div>
             
             <div class="floor" style="text-align:left;margin-top:7px;margin-left:61px;color:#444">
                     <span>${words.lm_id}楼</span>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <hr style="margin-top: 7px;"/>
             </div>
            </div>
      </c:forEach>
  </body>
</html>
