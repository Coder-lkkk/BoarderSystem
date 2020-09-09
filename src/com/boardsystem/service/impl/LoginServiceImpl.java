package com.boardsystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boardsystem.dao.LoginDao;
import com.boardsystem.po.User;
import com.boardsystem.service.LoginService;

@Service("loginService")
@Transactional

public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDao loginDao;
	@Override
	public User findUser(String username, String password) {
		User user = this.loginDao.findUser(username, password);
		return user;
	}
	
	@Override
	public void regist(String username,String password,String nickname){
		this.loginDao.regist(username, password, nickname);
	}

	@Override
	public List<User> checkIfDuplicate(String username) {
		// TODO Auto-generated method stub
		return this.loginDao.checkIfDuplicate(username);
	}

}
