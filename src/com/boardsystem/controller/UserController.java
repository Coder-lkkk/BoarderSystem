package com.boardsystem.controller;

import com.boardsystem.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boardsystem.service.UserService;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	//跳转到个人主页
	@RequestMapping("toUserHome.action")
	public String toUserHome(){
		return "user_home";
	}
	//退出登录
	@RequestMapping("logout.action")
	public String logout(){
		return "main";
	}
	
	@RequestMapping("getUserInfo.action")
	@ResponseBody
	public User getUserInfo(HttpSession session, Model model){
		User user = (User)session.getAttribute("user");
		model.addAttribute("user", this.userService.getUserInfo(user.getUsername()));
		System.out.println("session中的user："+userService.getUserInfo(user.getUsername()));
		return user;
	}
}
