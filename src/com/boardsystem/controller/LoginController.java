package com.boardsystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boardsystem.po.User;
import com.boardsystem.service.LoginService;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	@Autowired
	private LoginService loginService;

	//跳转到主页面
	@RequestMapping(value = "/toMainLogined.action")
	public String toMain(Model model) {
		return "main_logined";
	}
	
	//跳转到登录页面
	@RequestMapping(value = "/toLogin.action")
	public String toLogin() {
		return "login";
	}
	//跳转到注册页面
	@RequestMapping(value = "/toRegist.action")
	public String toRegist() {
		return "regist";
	}
	//登录
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	@ResponseBody
	public User login(@RequestBody User user,
			 			Model model,HttpSession session) {
		User user2 = loginService.findUser(user.getUsername(), user.getPassword());
		System.out.println("存在该用户"+user2);
		//创建session对象
		session.setAttribute("user",user2);
		//把用户数据保存在session域对象中
		System.out.println(session.getAttribute("user"));
		return user2;
/*		if(user2 != null){

			session.setAttribute("ADMIN_SESSION", user);

//			return "redirect:login/toMain.action";
			//return "redirect:customer/list.action";
			return "main";
		}
		model.addAttribute("msg", "输入有误，请重新输入");

		return "login";*/
	}
	//注册
	@RequestMapping(value = "/regist.action", method = RequestMethod.POST)
	@ResponseBody
	public int regist(@RequestBody User user,
			 			Model model,HttpSession session) {
		List<User> userList = this.loginService.checkIfDuplicate(user.getUsername());
		System.out.println("检测到的用户列表为："+userList);
		if(userList.isEmpty()){
			System.out.println("进行注册"+user);
			loginService.regist(user.getUsername(), user.getPassword(),user.getNickname());
			return 1;
		}
		model.addAttribute("message","用户名重复");
		return 2;
	}
	
}
