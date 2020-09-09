package com.boardsystem.service;

import java.util.List;

import com.boardsystem.po.User;

public interface LoginService {

	public User findUser(String username,String password);
	
	public void regist(String username,String password,String nickname);
	
	public List<User> checkIfDuplicate(String username);
}
