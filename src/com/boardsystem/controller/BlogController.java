package com.boardsystem.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boardsystem.po.Blog;
import com.boardsystem.service.BlogService;

@Controller
@RequestMapping(value = "/blog")
public class BlogController {
	@Autowired
	private BlogService blogService;
	
	//跳转到主页面
    @RequestMapping(value = "/toMain.action")
    public String toMain() {
        return "main";
    }
	
	//跳转到登录页面
    @RequestMapping(value = "/toLogin.action")
    public String toLogin() {
        return "login";
    }
    
	//得到置顶的博客列表
    @RequestMapping(value = "/getTopList.action")
    @ResponseBody
    public List<Blog> getTop_blog(Model model,HttpServletRequest request) {
    	List<Blog> topList = this.blogService.getTopList();
//    	model.addAttribute("topList","topList");
//    	request.setAttribute("topList","topList");
    	System.out.println("得到置顶博客"+topList);
    	return topList;
    }
    
	//置顶栏跳转到博客详情页面
    @RequestMapping(value = "/toBlogDetail_Top.action")        //因为只处理.action为后缀的请求，所以需要通过方法来跳转
    public String toBlogDetail(HttpServletRequest request,Model model) {
    	int id = Integer.parseInt(request.getParameter("id"));
    	Blog blog = this.blogService.getById_Top(id);
    	System.out.println(id);
    	model.addAttribute("blog",blog);
    	System.out.println("置顶博客详情"+blog);
        return "detail";
    }
    
  //分类栏跳转到博客详情页面
    @RequestMapping(value = "/toBlogDetail_SE.action")        //因为只处理.action为后缀的请求，所以需要通过方法来跳转
    public String toBlogDetail_SE(HttpServletRequest request,Model model) {
    	int id = Integer.parseInt(request.getParameter("id"));
    	Blog blog = this.blogService.getById_SE(id);
    	System.out.println(id);
    	model.addAttribute("blog",blog);
    	System.out.println("javaSE博客详情"+blog);
        return "detail";
    }
	//得到分类的博客列表
    @RequestMapping(value = "/getCategoryList.action")
    @ResponseBody
    public List<Blog> getCategory_blog(@RequestBody String category,Model model,HttpServletRequest request) {
    	List<Blog> categoryList = this.blogService.getCategoryList_SE(category);
    	return categoryList;             //使用@ReponseBody注解的返回值将不是返回页面，而是直接解析为json格式写入HTTP Response对象的body中
    }
    
    //跳转到发表/编辑博客页面
    @RequestMapping(value = "/toAddBlog.action")
    public String toAddBlog() {
        return "add";
    }
    
	//发表博客
    @RequestMapping(value = "/addBlog.action")
    public String addBlog(@RequestBody Blog blog) {
    	System.out.println(blog+"11111111111111");
    	this.blogService.addBlog(blog);
    	return "manageBlog";             //使用@ReponseBody注解的返回值将不是返回页面，而是直接解析为json格式写入HTTP Response对象的body中
    }
    
  //跳转到博客管理页面
    @RequestMapping(value = "/toManageBlog.action")
    public String toManageBlog() {
        return "manageBlog";
    }

}
