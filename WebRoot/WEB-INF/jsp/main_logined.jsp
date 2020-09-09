<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JavaHub</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" href="<%=basePath%>fly-master/res/layui/css/layui.css">
  <link rel="stylesheet" href="<%=basePath%>fly-master/res/css/global.css">
</head>
<body>
<script type="text/javascript" src="<%=basePath%>js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    function getTopList() {
        $.ajax({
            type:"post",
            url:"<%=basePath%>blog/getTopList.action",
            contentType:"application/json;charset=utf-8",
            success:function(data) {
                var topList = data;             
/*                 $("#author1").text(topList[0].author); */
                for(i=1;i<topList.length+1;i++){
                	$("#author"+i).text(topList[i-1].author)
                	$("#title"+i).text(topList[i-1].title)
                	$("#type"+i).text(topList[i-1].type)
                	$("#vip"+i).text("vip"+topList[i-1].vip)
                	$("#date"+i).text(topList[i-1].date)   
                	$("#title"+i).attr("href","<%=basePath%>blog/toBlogDetail_Top.action?id="+i)    	
                }
            }
        });
    }
    
    function getCategoryList() {
        $.ajax({
            type:"post",
            url:"<%=basePath%>blog/getCategoryList.action",
            data:"java",
            contentType:"application/json;charset=utf-8",
            success:function(data) {
                var categoryList = data;             
/*                 $("#author1").text(topList[0].author); */
                for(i=1;i<categoryList.length+1;i++){
                	$("#cate-author"+i).text(categoryList[i-1].author)
                	$("#cate-title"+i).text(categoryList[i-1].title)
                	$("#cate-type"+i).text(categoryList[i-1].type)
                	$("#cate-date"+i).text(categoryList[i-1].date)   
                	$("#cate-title"+i).attr("href","<%=basePath%>blog/toBlogDetail_SE.action?id="+i)    	    	
                }
            }
        });
    }
    window.onload=function(){
    getTopList();
    getCategoryList();
    }
</script>


<div class="fly-header layui-bg-black">
  <div class="layui-container">
    <a class="fly-logo" href="#">
      <img src="<%=basePath%>fly-master/res/images/logo.jpg" alt="layui">
    </a>
  
    
    <ul class="layui-nav fly-nav-user">
      
<%--       <!-- 未登入的状态 -->
      <li class="layui-nav-item">
        <a class="iconfont icon-touxiang layui-hide-xs" href="user/login.html"></a>
      </li>
      <li class="layui-nav-item">
        <a href="<%=basePath%>/blog/toLogin.action">登入</a>
      </li>
      <li class="layui-nav-item">
        <a href="user/reg.html">注册</a>
      </li>
      <li class="layui-nav-item layui-hide-xs">
        <a href="/app/qq/" onclick="layer.msg('正在通过QQ登入', {icon:16, shade: 0.1, time:0})" title="QQ登入" class="iconfont icon-qq"></a>
      </li>
      <li class="layui-nav-item layui-hide-xs">
        <a href="/app/weibo/" onclick="layer.msg('正在通过微博登入', {icon:16, shade: 0.1, time:0})" title="微博登入" class="iconfont icon-weibo"></a>
      </li> --%>
      
      <!-- 登入后的状态 -->
      <li class="layui-nav-item">
        <a class="fly-nav-avatar" href="javascript:;">
          <cite class="layui-hide-xs">${sessionScope.user.nickname}</cite>
          <i class="iconfont icon-renzheng layui-hide-xs" title="认证信息：layui 作者"></i>
          <i class="layui-badge fly-badge-vip layui-hide-xs">VIP${sessionScope.user.vip}</i>
          <img src="<%=basePath%>fly-master/res/images/head_photo.png">
        </a>
        <dl class="layui-nav-child">
          <dd><a href="<%=basePath%>user/toUserHome.action"><i class="layui-icon" style="margin-left: 2px; font-size: 22px;">&#xe68e;</i>我的主页</a></dd>
          <dd><a href="#"><i class="layui-icon">&#xe620;</i>管理博客</a></dd>
          <dd><a href="user/set.html"><i class="layui-icon">&#xe620;</i>基本设置</a></dd>
          <dd><a href="user/message.html"><i class="iconfont icon-tongzhi" style="top: 4px;"></i>我的消息</a></dd>
          <hr style="margin: 5px 0;">
          <dd><a href="<%=basePath%>user/logout.action" style="text-align: center;">退出</a></dd>
        </dl>
      </li>
     
    </ul>
  </div>
</div>

<div class="fly-panel fly-column">
  <div class="layui-container">
    <ul class="layui-clear">
      <li class="layui-hide-xs layui-this"><a href="<%=basePath%>blog/toMain.action">首页</a></li> 
      <li><a title="未实现" href="#">公告</a></li> 
      <li><a title="未实现" href="#">动态</a></li> 
      <li>${id}</li> 
      <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><span class="fly-mid"></span></li> 
      
      <!-- 用户登入后显示 -->
      <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a title="未实现" href="#">我发表的贴</a></li> 
      <li class="layui-hide-xs layui-hide-sm layui-show-md-inline-block"><a title="未实现" href="#">我收藏的贴</a></li> 
    </ul> 
    
    <div class="fly-column-right layui-hide-xs"> 
      <span class="fly-search"><i class="layui-icon"></i></span> 
      <a href="<%=basePath%>blog/toAddBlog.action" class="layui-btn">发表新帖</a> 
    </div> 
    <div class="layui-hide-sm layui-show-xs-block" style="margin-top: -10px; padding-bottom: 10px; text-align: center;"> 
      <a href="<%=basePath%>blog/toAddBlog.action" class="layui-btn">发表新帖</a> 
    </div> 
  </div>
</div>

  <div class="layui-side layui-bg-black" style="width:160px;margin-top:60px;">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">java技术</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">JavaSE</a></dd>
            <dd><a href="javascript:;">JavaEE</a></dd>
            <dd><a href="javascript:;">J2ME</a></dd>
             <dd><a href="javascript:;">JavaWeb</a></dd>
            <dd><a href="javascript:;">Eclipse</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">移动开发</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">IOS</a></dd>
            <dd><a href="javascript:;">Android</a></dd>
            <dd><a href="javascript:;">微信开发</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">网络与通信</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">网络协议与配置</a></dd>
            <dd><a href="javascript:;">网络维护与管理</a></dd>
            <dd><a href="javascript:;">交换及路由技术</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="">其他技术论坛</a></li>
        <li class="layui-nav-item"><a href="">公告专区</a></li>
      </ul>
    </div>
  </div>
<div class="layui-container">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md8">
      <div class="fly-panel">
        <div class="fly-panel-title fly-filter">
          <a>置顶</a>
          <a href="#signin" class="layui-hide-sm layui-show-xs-block fly-right" id="LAY_goSignin" style="color: #FF5722;">去签到</a>
        </div>

        
        <ul id="blog-list" class="fly-list">
          <li id="top-1">
            <a href="user/home.html" class="fly-avatar">
              <img src="<%=basePath%>fly-master/res/images/head_photo1.jpg" alt="贤心">
            </a>
            <h2>
              <a id="type1" class="layui-badge">动态</a>
              <a id="title1" href=""></a>
            </h2>
            <div class="fly-list-info">
              <a href="user/home.html" link>
                <cite id="author1"></cite>
                <i id="vip1" class="layui-badge fly-badge-vip"></i>
              </a>
              <span id="date1"></span>
              
              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
              <span class="fly-list-nums"> 
                <i class="iconfont icon-pinglun1" title="回复"></i> 66
              </span>
            </div>
            <div class="fly-list-badge">
              <!--
              <span class="layui-badge layui-bg-black">置顶</span>
              <span class="layui-badge layui-bg-red">精帖</span>
              -->
            </div>
          </li>
          
          <li id="top-2">
            <a href="user/home.html" class="fly-avatar">
              <img src="<%=basePath%>fly-master/res/images/head_photo2.jpg" alt="贤心">
            </a>
            <h2>
              <a id="type2" class="layui-badge">动态</a>
              <a id="title2" href=""></a>
            </h2>
            <div class="fly-list-info">
              <a href="user/home.html" link>
                <cite id="author2"></cite>
                <i id="vip2" class="layui-badge fly-badge-vip"></i>
              </a>
              <span id="date2"></span>
              
              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
              <span class="fly-list-nums"> 
                <i class="iconfont icon-pinglun1" title="回复"></i> 66
              </span>
            </div>
            <div class="fly-list-badge">
              <!--
              <span class="layui-badge layui-bg-black">置顶</span>
              <span class="layui-badge layui-bg-red">精帖</span>
              -->
            </div>
          </li>
          
          <li id="top-3">
            <a href="user/home.html" class="fly-avatar">
              <img src="<%=basePath%>fly-master/res/images/head_photo3.jpg" alt="贤心">
            </a>
            <h2>
              <a id="type3" class="layui-badge">动态</a>
              <a id="title3" href=""></a>
            </h2>
            <div class="fly-list-info">
              <a href="user/home.html" link>
                <cite id="author3"></cite>
                <i id="vip3" class="layui-badge fly-badge-vip"></i>
              </a>
              <span id="date3"></span>
              
              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
              <span class="fly-list-nums"> 
                <i class="iconfont icon-pinglun1" title="回复"></i> 66
              </span>
            </div>
            <div class="fly-list-badge">
              <!--
              <span class="layui-badge layui-bg-black">置顶</span>
              <span class="layui-badge layui-bg-red">精帖</span>
              -->
            </div>
          </li>
          
          <li id="top-4">
            <a href="user/home.html" class="fly-avatar">
              <img src="<%=basePath%>fly-master/res/images/head_photo4.jpg" alt="贤心">
            </a>
            <h2>
              <a id="type4" class="layui-badge">动态</a>
              <a id="title4" href=""></a>
            </h2>
            <div class="fly-list-info">
              <a href="user/home.html" link>
                <cite id="author4"></cite>
                <i id="vip4" class="layui-badge fly-badge-vip"></i>
              </a>
              <span id="date4"></span>
              
              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
              <span class="fly-list-nums"> 
                <i class="iconfont icon-pinglun1" title="回复"></i> 66
              </span>
            </div>
            <div class="fly-list-badge">
              <!--
              <span class="layui-badge layui-bg-black">置顶</span>
              <span class="layui-badge layui-bg-red">精帖</span>
              -->
            </div>
          </li>
          
          <li id="top-5">
            <a href="user/home.html" class="fly-avatar">
              <img src="<%=basePath%>fly-master/res/images/head_photo5.jpg" alt="贤心">
            </a>
            <h2>
              <a id="type5" class="layui-badge">动态</a>
              <a id="title5" href=""></a>
            </h2>
            <div class="fly-list-info">
              <a href="user/home.html" link>
                <cite id="author5"></cite>
                <i id="vip5" class="layui-badge fly-badge-vip"></i>
              </a>
              <span id="date5"></span>
              
              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
              <span class="fly-list-nums"> 
                <i class="iconfont icon-pinglun1" title="回复"></i> 66
              </span>
            </div>
            <div class="fly-list-badge">
              <!--
              <span class="layui-badge layui-bg-black">置顶</span>
              <span class="layui-badge layui-bg-red">精帖</span>
              -->
            </div>
          </li>
        </ul>
      </div>
      <!-- -------------------------分类的博客------------------------------------------ -->

      <div class="fly-panel" style="margin-bottom: 0;">
        
        <div class="fly-panel-title fly-filter">
        <p>Java</p>
        </div>

        <ul id="category-list"class="fly-list">          
          <li id="cate-1">
            <a href="user/home.html" class="fly-avatar">
              <img src="<%=basePath%>fly-master/res/images/head_photo6.jpg" alt="贤心">
            </a>
            <h2>
              <a id="cate-type1" class="layui-badge">动态</a>
              <a id="cate-title1" href="<%=basePath%>/blog/toBlogDetail_SE.action?id=1"></a>
            </h2>
            <div class="fly-list-info">
              <a href="user/home.html" link>
                <cite id="cate-author1"></cite>
              </a>
              <span id="cate-date1"></span>
              
              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
              <span class="fly-list-nums"> 
                <i class="iconfont icon-pinglun1" title="评论"></i> 66
              </span>
            </div>
            <div class="fly-list-badge">
              <!--
              <span class="layui-badge layui-bg-black">置顶</span>
              <span class="layui-badge layui-bg-red">精帖</span>
              -->
            </div>
          </li>
          
          <li id="cate-2">
            <a href="user/home.html" class="fly-avatar">
              <img src="<%=basePath%>fly-master/res/images/head_photo7.jpg" alt="贤心">
            </a>
            <h2>
              <a id="cate-type2" class="layui-badge">动态</a>
              <a id="cate-title2" href="<%=basePath%>/blog/toBlogDetail_SE.action?id=2"></a>
            </h2>
            <div class="fly-list-info">
              <a href="user/home.html" link>
                <cite id="cate-author2"></cite>
              </a>
              <span id="cate-date2"></span>
              
              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
              <span class="fly-list-nums"> 
                <i class="iconfont icon-pinglun1" title="评论"></i> 66
              </span>
            </div>
            <div class="fly-list-badge">
              <!--
              <span class="layui-badge layui-bg-black">置顶</span>
              <span class="layui-badge layui-bg-red">精帖</span>
              -->
            </div>
          </li>
          
          <li id="cate-3">
            <a href="user/home.html" class="fly-avatar">
              <img src="<%=basePath%>fly-master/res/images/head_photo8.jpg" alt="贤心">
            </a>
            <h2>
              <a id="cate-type3" class="layui-badge">动态</a>
              <a id="cate-title3" href="<%=basePath%>/blog/toBlogDetail_SE.action?id=3"></a>
            </h2>
            <div class="fly-list-info">
              <a href="user/home.html" link>
                <cite id="cate-author3"></cite>
              </a>
              <span id="cate-date3"></span>
              
              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
              <span class="fly-list-nums"> 
                <i class="iconfont icon-pinglun1" title="评论"></i> 66
              </span>
            </div>
            <div class="fly-list-badge">
              <!--
              <span class="layui-badge layui-bg-black">置顶</span>
              <span class="layui-badge layui-bg-red">精帖</span>
              -->
            </div>
          </li>
          
          <li id="cate-4">
            <a href="user/home.html" class="fly-avatar">
              <img src="<%=basePath%>fly-master/res/images/head_photo2.jpg" alt="贤心">
            </a>
            <h2>
              <a id="cate-type4" class="layui-badge">动态</a>
              <a id="cate-title4" href="<%=basePath%>/blog/toBlogDetail_SE.action?id=4"></a>
            </h2>
            <div class="fly-list-info">
              <a href="user/home.html" link>
                <cite id="cate-author4"></cite>
              </a>
              <span id="cate-date4"></span>
              
              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
              <span class="fly-list-nums"> 
                <i class="iconfont icon-pinglun1" title="评论"></i> 66
              </span>
            </div>
            <div class="fly-list-badge">
              <!--
              <span class="layui-badge layui-bg-black">置顶</span>
              <span class="layui-badge layui-bg-red">精帖</span>
              -->
            </div>
          </li>
          
          <li id="cate-5">
            <a href="user/home.html" class="fly-avatar">
              <img src="<%=basePath%>fly-master/res/images/head_photo2.jpg" alt="贤心">
            </a>
            <h2>
              <a id="cate-type5" class="layui-badge">动态</a>
              <a id="cate-title5" href="<%=basePath%>/blog/toBlogDetail_SE.action?id=5"></a>
            </h2>
            <div class="fly-list-info">
              <a href="user/home.html" link>
                <cite id="cate-author5"></cite>
              </a>
              <span id="cate-date5"></span>
              
              <span class="fly-list-kiss layui-hide-xs" title="悬赏飞吻"><i class="iconfont icon-kiss"></i> 60</span>
              <span class="fly-list-nums"> 
                <i class="iconfont icon-pinglun1" title="评论"></i> 66
              </span>
            </div>
            <div class="fly-list-badge">
              <!--
              <span class="layui-badge layui-bg-black">置顶</span>
              <span class="layui-badge layui-bg-red">精帖</span>
              -->
            </div>
          </li>
          
        </ul>
        
        <div style="text-align: center">
          <div class="laypage-main">
            <a href="jie/index.html" class="laypage-next">查看更多</a>
          </div>
        </div>

      </div>
    </div>
    <div class="layui-col-md4">

      <div class="fly-panel">
        <h3 class="fly-panel-title">温馨通道</h3>
        <ul class="fly-panel-main fly-list-static">
          <li>
            <a href="http://fly.layui.com/jie/4281/" target="_blank">layui 的 GitHub 及 Gitee (码云) 仓库，欢迎Star</a>
          </li>
          <li>
            <a href="http://fly.layui.com/jie/5366/" target="_blank">
              layui 常见问题的处理和实用干货集锦
            </a>
          </li>
          <li>
            <a href="http://fly.layui.com/jie/4281/" target="_blank">layui 的 GitHub 及 Gitee (码云) 仓库，欢迎Star</a>
          </li>
          <li>
            <a href="http://fly.layui.com/jie/5366/" target="_blank">
              layui 常见问题的处理和实用干货集锦
            </a>
          </li>
          <li>
            <a href="http://fly.layui.com/jie/4281/" target="_blank">layui 的 GitHub 及 Gitee (码云) 仓库，欢迎Star</a>
          </li>
        </ul>
      </div>


      <div class="fly-panel fly-signin">
        <div class="fly-panel-title">
          签到
          <i class="fly-mid"></i> 
          <a href="javascript:;" class="fly-link" id="LAY_signinHelp">说明</a>
          <i class="fly-mid"></i> 
          <a href="javascript:;" class="fly-link" id="LAY_signinTop">活跃榜<span class="layui-badge-dot"></span></a>
          <span class="fly-signin-days">已连续签到<cite>16</cite>天</span>
        </div>
        <div class="fly-panel-main fly-signin-main">
          <button class="layui-btn layui-btn-danger" id="LAY_signin">今日签到</button>
          <span>可获得<cite>5</cite>飞吻</span>
          
          <!-- 已签到状态 -->
          <!--
          <button class="layui-btn layui-btn-disabled">今日已签到</button>
          <span>获得了<cite>20</cite>飞吻</span>
          -->
        </div>
      </div>

      <div class="fly-panel fly-rank fly-rank-reply" id="LAY_replyRank">
        <h3 class="fly-panel-title">回贴周榜</h3>
        <dl>
          <!--<i class="layui-icon fly-loading">&#xe63d;</i>-->
<!--           <dd>
            <a href="user/home.html">
              <img src="https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"><cite>贤心</cite><i>106次回答</i>
            </a>
          </dd> -->
          
        </dl>
      </div>

      <dl class="fly-panel fly-list-one">
        <dt class="fly-panel-title">本周热议</dt>
<!--         <dd>
          <a href="jie/detail.html">基于 layui 的极简社区页面模版</a>
          <span><i class="iconfont icon-pinglun1"></i> 16</span>
        </dd>
         -->
         
<!--         无数据时 -->
        
        <div class="fly-none">没有相关数据</div>
       
      </dl>

      <div class="fly-panel">
        <div class="fly-panel-title">
          这里可作为广告区域
        </div>
        <div class="fly-panel-main">
          <a href="http://layim.layui.com/?from=fly" target="_blank" class="fly-zanzhu" time-limit="2017.09.25-2099.01.01" style="background-color: #5FB878;"></a>
        </div>
      </div>
      
      <div class="fly-panel fly-link">
        <h3 class="fly-panel-title">友情链接</h3>
        <dl class="fly-panel-main">
          <dd><a href="http://www.layui.com/" target="_blank">layui</a><dd>
          <dd><a href="http://layim.layui.com/" target="_blank">WebIM</a><dd>
          <dd><a href="http://layer.layui.com/" target="_blank">layer</a><dd>
          <dd><a href="http://www.layui.com/laydate/" target="_blank">layDate</a><dd>
          <dd><a href="mailto:xianxin@layui-inc.com?subject=%E7%94%B3%E8%AF%B7Fly%E7%A4%BE%E5%8C%BA%E5%8F%8B%E9%93%BE" class="fly-link">申请友链</a><dd>
        </dl>
      </div>

    </div>
  </div>
</div>

<div class="fly-footer">
  <p><a href="http://fly.layui.com/" target="_blank">Fly社区</a> 2017 &copy; <a href="http://www.layui.com/" target="_blank">layui.com 出品</a></p>
  <p>
    <a href="http://fly.layui.com/jie/3147/" target="_blank">付费计划</a>
    <a href="http://www.layui.com/template/fly/" target="_blank">获取Fly社区模版</a>
    <a href="http://fly.layui.com/jie/2461/" target="_blank">微信公众号</a>
  </p>
</div>
 
<script src="<%=basePath%>fly-master/res/layui/layui.js"></script>
<script>
layui.cache.page = '';
layui.cache.user = {
  username: '游客'
  ,uid: -1
  ,avatar: '../res/images/avatar/00.jpg'
  ,experience: 83
  ,sex: '男'
};
layui.config({
  version: "3.0.0"
  ,base: 'http://localhost:8080/BoardSystem/fly-master/res/mods/' //这里实际使用时，建议改成绝对路径
}).extend({
  fly: 'index'
}).use('fly');
</script>

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_30088308'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "w.cnzz.com/c.php%3Fid%3D30088308' type='text/javascript'%3E%3C/script%3E"));</script>

</body>
</html>