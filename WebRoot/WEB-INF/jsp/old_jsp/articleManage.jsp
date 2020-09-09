<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'articleManage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="styles.css">

    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=basePath%>/static/css/bootstrap.min.css"/>

  </head>
  
  <body>
    <div class="container" style="width: 90%;">
    <br/>
    <br/>
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="margin-left: 0px;padding: 0 10px;text-align: left;width: 160px;border-bottom: none;"><strong>帖子管理列表</strong></legend>
        </fieldset>
        <br/>
<!--         <h5 style="margin-top: -20px;">
            <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
            <span style="color: #299A74;"><strong>输入查询信息</strong></span>
        </h5> -->
        </div>
        <div class="form table">
    
<!--     <h5>
        <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
        <span style="color: #299A74;"><strong>查询结果展示</strong></span>
    </h5>
 -->
    <hr style="margin-top: 0;"/>

    <c:if test="${sessionScope.identity_id ne 4}">
        <div class="layui-inline">
            <button type="button" id="cleanBtnMore" class="layui-btn layui-btn-danger">批量删除</button>
            <a href="<%=basePath%>/article/toArticleWrite.action"><button type="button" id="addBtn" class="layui-btn layui-btn">新增帖子</button></a>
        </div>
    </c:if>
    <br/>
    <br/>

    <div class="table-responsive">
        <table class="table table-striped table-hover" id="countTable">
            <thead>
            <tr>
                <th style="text-align: center"><input type="checkbox" id="all"/></th>
                <th style="text-align:center;">帖子编号</th>
                <th style="text-align: center">帖子简介</th>
                <th style="text-align: center">帖子作者</th>
                <th style="text-align: center">发表日期</th>
                <c:if test="${sessionScope.identity_id ne 4}">
                    <th style="text-align: center">管理</th>
                </c:if>
            </tr>
            </thead>

            <tbody style="text-align: center">
            <c:forEach items="${requestScope.page.beanList}" var="article">
                <tr>
                    <td><input name="art_id" value="${article.art_id}" type="checkbox"/></td>
                    <td>${article.art_id}</td>
                    <td>${article.art_summary}</td>
                    <td>${article.art_author}</td>
                    <td>${article.art_date}</td>
                    <td>
                        <a href="<%=basePath%>/article/toArticleView.action?art_id=${article.art_id}"><button type="button" class="layui-btn layui-btn-sm">查看</button></a>
                        <a href="<%=basePath%>/article/toArticleUpdate.action?art_id=${article.art_id}"><button type="button" class="layui-btn layui-btn-sm layui-btn-normal">编辑</button></a>
                        <button type="button" onclick="return clean(${article.art_id});" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div> 


    <form class="listForm" name="listForm" method="post" action="<%=basePath%>/article/findByPage.action">
        <div class="row">
            <div class="form-inline" style="margin-left: 15px;">
                <label style="font-size:14px;margin-top:22px;">
                    <strong>共<b>${requestScope.page.totalCount}</b>条记录，共<b>${requestScope.page.totalPage}</b>页</strong>
                    &nbsp;
                    &nbsp;
                    <strong>每页显示</strong>                   
                    <select class="form-control" name="pageSize">
                        <option value="2"
                                <c:if test="${requestScope.page.pageSize == 2}">selected</c:if> >2
                        </option>
                        <option value="3"
                                <c:if test="${requestScope.page.pageSize == 3}">selected</c:if> >3
                        </option>
                        <option value="4"
                                <c:if test="${requestScope.page.pageSize == 4}">selected</c:if> >4
                        </option>
                        <option value="5"
                                <c:if test="${requestScope.page.pageSize == 5}">selected</c:if> >5
                        </option>
                    </select>
                    <strong>条</strong>
                    &nbsp;
                    &nbsp;
                    
                    <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                    class="form-control input-sm"
                                                    style="width:11%"/>&nbsp;<strong>页</strong>
                    &nbsp;
                    <button type="submit" class="btn btn-sm btn-info">GO!</button>
                </label>
                
                <ul class="pagination" style="float:right;">
                    <li>
                        <a href="<%=basePath%>/article/findByPage.action?pageCode=1"><strong>首页</strong></a>
                    </li>

                    <li>
                        <c:if test="${requestScope.page.pageCode > 2}">
                            <a href="<%=basePath%>/article/findByPage.action?pageCode=${requestScope.page.pageCode - 1}">&laquo;</a>
                        </c:if>
                    </li>



                    <!-- 写关于分页页码的逻辑 -->
                    <c:choose>
                        <c:when test="${requestScope.page.totalPage <= 5}">

                            <c:set var="begin" value="1"/>

                            <c:set var="end" value="${requestScope.page.totalPage}"/>

                        </c:when>

                        <c:otherwise>

                            <c:set var="begin" value="${requestScope.page.pageCode - 1}"/>

                            <c:set var="end" value="${requestScope.page.pageCode + 3}"/>



                            <!-- 头溢出 -->

                            <c:if test="${begin < 1}">

                                <c:set var="begin" value="1"/>

                                <c:set var="end" value="5"/>

                            </c:if>



                            <!-- 尾溢出 -->

                            <c:if test="${end > requestScope.page.totalPage}">

                                <c:set var="begin" value="${requestScope.page.totalPage -4}"/>

                                <c:set var="end" value="${requestScope.page.totalPage}"/>

                            </c:if>

                        </c:otherwise>

                    </c:choose>



                    <!-- 显示页码 -->

                    <c:forEach var="i" begin="${begin}" end="${end}">

                        <!-- 判断是否是当前页 -->

                        <c:if test="${i == requestScope.page.pageCode}">

                            <li class="active"><a href="javascript:void(0);">${i}</a></li>

                        </c:if>

                        <c:if test="${i != requestScope.page.pageCode}">

                            <li>

                                <a href="<%=basePath%>/article/findByPage.action?pageCode=${i}">${i}</a>

                            </li>

                        </c:if>

                    </c:forEach>



                    <li>
                        <c:if test="${requestScope.page.pageCode < requestScope.page.totalPage}">
                            <a href="<%=basePath%>/article/findByPage.action?pageCode=${requestScope.page.pageCode + 1}">&raquo;</a>
                        </c:if>
                    </li>
                    <li>

                        <a href="<%=basePath%>/article/findByPage.action?pageCode=${requestScope.page.totalPage}"><strong>末页</strong></a>
                    </li>
                </ul>
            </div>
        </div>
    </form>
</div>
</body>

<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<script src="<%=basePath%>/static/js/bootstrap.min.js"></script>

<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });

</script>

<script type="text/javascript">
    //删除
    function clean(art_id){
        layer.open({
            title: '警告信息',
            content: '你确定要删除？',
            btn: ['确定','取消'],
            btn1: function(index,layero){
                $.ajax({
                    url: '<%=basePath%>/article/deleteArticle.action',
                    type: 'POST',
                    data: {art_id:art_id},
                    success: function(data){
                        layer.open({
                           title: '提示信息',
                            content: '删除成功',
                            time: 2000
                        });
                        $("body").html(data);
                    },
                    error: function(){
                        layer.open({
                            title: '提示信息',
                            content: '删除失败'
                        });
                    }
                });
                layer.close(index);
            }
        });
    }


    //编辑

    function edit(r_id){

        $.ajax({

            url: '<%=basePath%>/article/toEditPage.do',

            type: 'GET',

            data: {r_id: r_id},

            success: function(data){

                $("body").html(data);

            },

            error: function(){

                layer.open({

                    title: '提示信息',

                    content: '发生错误'

                });

            }

        });

    }



    $("#cleanBtnMore").click(function(){

        layer.open({

            title: '警告信息',

            content: '你确定要删除所选文章吗？',

            btn: ['确定','取消'],

            btn1: function(index,layero){

                layer.close(index);

            }

        });

    });



    //全选

    var all = $("#all");

    var id = $("#art_id");

    all.onclick = function(){

        for (var i = 0;i<id.length;i++){

            id[i].checked = all.checked;

        }

    }
</script>
</html>

