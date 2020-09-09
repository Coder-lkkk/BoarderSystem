package com.boardsystem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boardsystem.dao.UserDao;
import com.boardsystem.po.User;
import com.boardsystem.service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	
	@Override
	public User getUserInfo(String username){
		return this.userDao.getUserInfo(username);
	}
}
