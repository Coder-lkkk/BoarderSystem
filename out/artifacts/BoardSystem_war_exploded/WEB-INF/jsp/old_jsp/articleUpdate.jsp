
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
    
    <title>My JSP 'articleUpdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>
  </head>
  
  <body>
<div class="container">
    <!-- 文章信息的表单 -->
    <div class="layui-form">
        <form>
            <div class="layui-inline" style="margin-left: -10px;">
                <label class="layui-form-label" style="padding-left: 0;"><strong>帖子编号</strong></label>
                <div class="layui-input-inline" style="margin-left: -502px;">
                    <input name="art_id" id="art_id" class="layui-input" value="${article.art_id}" readonly="readonly"/>
                </div>
                <label class="layui-form-label" style="margin-left: 157px;width:90px;"><strong>帖子作者</strong></label>
                <div class="layui-input-inline" style="margin-left:87px;">
                    <input type="text" name="art_author" id="art_author" value="${article.art_author}" class="layui-input"/>
                </div>
                <label class="layui-form-label" style="margin-left:169px;padding-left: 0;"><strong>发布日期</strong></label>
                <div class="layui-input-inline" style="margin-left: 88px;">
                    <input type="text" name="art_date" id="art_date" value="${article.art_date}" class="layui-input"/>
                </div>
            </div>
            <hr style="margin-top: 0;"/>
            <div class="layui-inline" style="margin-left: -10px;padding-left: 0;">
                <label class="layui-form-label" style="padding-left: 0;"><strong>帖子简介</strong></label>
                <div class="layui-input-inline" style="margin-left: -6px;width: 275px;">
                        <input type="text" name="art_summary" id="art_summary" value="${article.art_summary}" class="layui-input"/>
                </div>
            </div>
            <br/>
            <br/>
            <label><strong>帖子内容</strong></label>
            <!-- 加载Markdown富文本容器 -->
            <div id="content" class="form-control">${article.art_content}</div>
            <div class="layui-inline" style="margin-top: 20px;">
                <button type="button" id="publishBtn" class="layui-btn">发布</button>
                <button type="button" id="cleanBtn" class="layui-btn">清空</button>
            </div>
        </form>
    </div>
</div>
  </body>
<!-- JQuery的配置 -->
<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<!-- 加载Layui的配置 -->
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<!-- Markdwon富文本 -->
<script src="<%=basePath%>/static/editormd/lib/marked.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/prettify.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/raphael.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/underscore.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/sequence-diagram.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/flowchart.min.js"></script>
<script src="<%=basePath%>/static/editormd/lib/jquery.flowchart.min.js"></script>
<script src="<%=basePath%>/static/editormd/editormd.min.js"></script>
<script type="text/javascript">
    var markdown;
    $(function(){
        markdown = editormd.markdownToHTML('content',{
            htmlDecode: "style,script,iframe",
            syncScrolling: 'single',
            emoji: true,
            taskList: true,
            tex: true,
            flowChart: true,
            sequenceDiagram: true,
            codeFold: true
        });
    });
</script>

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

<script type="text/javascript">
            //如果点击发布按钮
    $("#publishBtn").click(function(){
        var art_id = $("#art_id").val();
        var art_author = $("#art_author").val();
        var art_summary = $("#art_summary").val();
        var art_content = ue.getContent();
        var art_date = $("#art_date").val();
        $.ajax({
            url: '<%=basePath%>/article/updateArticle.action',
            type: 'POST',
            data: {
                art_id: art_id,
                art_author: art_author,
                art_summary: art_summary,
                art_content: art_content,
                art_date: art_date,
            },
            success: function(data){
                return "redirect:toArticleUpdate.action";
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '更新信息失败'
                });
            }
        });
    });
    // 清空
    $("#cleanBtn").click(function(){
        layer.open({
            title: '警告信息',
            content: '你确定要清空文章内容吗？',
            btn: ['确定','取消'],
            btn1: function(index,layero){
                ue.execCommand('cleardoc');
                layer.close(index);
            }
        });
    });
</script>
</html>
