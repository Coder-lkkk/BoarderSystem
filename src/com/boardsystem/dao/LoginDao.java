package com.boardsystem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.boardsystem.po.User;

public interface LoginDao {

	public User findUser(@Param("username") String username,
			             @Param("password")  String password);
	 
	public void regist(@Param("username") String username,
            			 @Param("password") String password,
            			 @Param("nickname") String nickname);
	
	public List<User> checkIfDuplicate(@Param("username") String username);
}
