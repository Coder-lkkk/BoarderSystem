
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	language="java"%>
<%@ page isELIgnored="false"%>
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

<title>My JSP 'articleSAVE.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<title>Title</title>

<link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css" />
<link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css" />
<link rel="stylesheet"href="<%=basePath%>/static/editormd/editormd.min.css" />
</head>

<body>
	<div class="container" style="width:80%;">
		<div style="margin-top: 60px;">
			<fieldset class="layui-elem-field layui-field-title">
				<legend
					style="margin-left: 20px;padding: 0 10px;text-align: left;width: 100px;border-bottom: none;">
					<strong>文章撰写</strong>
				</legend>
			</fieldset>
		</div>
		<br />
		<!-- 编辑器的表单 -->
		<div class="layui-form">
			<form action="<%=basePath%>/" method="post">
				<div class="layui-inline" style="margin-left: -10px;">
					<label class="layui-form-label" style="padding-left: 0;"><strong>文章作者</strong></label>
					<div class="layui-input-inline" style="margin-left:-255px;">
						<input type="text" name="art_author" id="art_author"
							value="${sessionScope.name}" class="layui-input" />
					</div>

					<label class="layui-form-label"
						style="margin-left:169px;padding-left: 0;"><strong>发布日期</strong></label>

					<div class="layui-input-inline" style="margin-left: 88px;">
						<input type="text" name="art_date" id="art_date"
							value="<%=nowDate%>" class="layui-input" readonly="readonly" />
					</div>
				</div>

				<hr style="margin-top: 0;" />

				<div class="layui-inline"
					style="margin-left: -10px;padding-left: 0;">
					<label class="layui-form-label" style="padding-left: 0;"><strong>文章简介</strong></label>
					<div class="layui-input-inline"
						style="margin-left: -6px;width: 275px;">
						<input type="text" name="art_summary" id="art_summary"
							placeholder="请输入文章简介" class="layui-input" />
					</div>
				</div>
				<br /> <br /> <label><strong>文章内容</strong></label>

				<!-- 添加Markdown的容器 -->

				<div id="editormd">
					<textarea id="textArea1" class="editormd-markdown-textarea"
						name="editormd-markdown-doc"></textarea>
					<textarea id="textArea2" class="editormd-html-textarea" name="editormd-html-code"></textarea>
				</div>

				<div class="layui-inline" style="margin-top: 20px;">
					<button type="button" id="publishBtn" class="layui-btn">发布</button>
					<button type="button" id="cleanBtn" class="layui-btn">清空</button>
				</div>
			</form>
		</div>
		<br /> <br /> <br />
	</div>
</body>
<!-- JQuery的配置 -->
<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<!-- 加载Layui的配置 -->
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<!-- Markdown富文本 -->
<script src="<%=basePath%>/static/editormd/editormd.min.js"></script>
<script type="text/javascript">
    <!-- 初始化layui -->
    layui.use('element', function(){
        var element = layui.element;
    });
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#art_date'
        });
    });
</script>

<!-- Markdown富文本编辑器 -->
<script type="text/javascript">
    var markdown;
    $(function(){
        markdown=editormd("editormd",{
            width: '100%',
            height: '80%',
            syncScrolling: 'single',
            path: '<%=basePath%>/static/editormd/lib/',
            saveHTMLToTextarea: true
        });
    });
</script>

<script type="text/javascript">
    // 如果点击了发布按钮
    $("#publishBtn").click(function(){
<%--             $.post("<%=basePath%>article/saveArticle",
                $("#articleMessage").serialize(),function(data){
               if(data=="OK"){
                  alert("发帖成功");
              }else{
              alert("发帖失败");
              }
        }) --%>
        var art_author =  $("#art_author").val();
        var art_summary = $("#art_summary").val();
        var art_content = markdown.getMarkdown();
        var art_date = $("#art_date").val();
        $.ajax({
            url: '${pageContext.request.contextPath}/article/saveArticle.action',
            type: 'post',
            async: true,
            contentType:'application/json;charset=UTF-8',
            data: JSON.stringify({
                art_id:1,
                art_author: art_author,
                art_summary: art_summary,
                art_content: art_content,
                art_date: art_date,
            }),
            success: function(data){
                return "redirect:toArticleManage.action";
            },
           error: function(XMLHttpRequest, textStatus, errorThrown) {
               alert(XMLHttpRequest.status);
               alert(XMLHttpRequest.readyState);
               alert(textStatus);        
            }           
        });
    });
    
<!--     // 清空
    $("#cleanBtn").click(function(){
        layer.open({
            title: '警告信息',
            content: '你确定要清空文章内容吗？',
            btn: ['确定','取消'],
            btn1: function(index,layero){
                $("#textArea1").val("");
            }
        });
    });
</script> -->
</html>
