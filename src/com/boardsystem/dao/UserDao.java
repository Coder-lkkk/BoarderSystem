package com.boardsystem.dao;

import org.apache.ibatis.annotations.Param;

import com.boardsystem.po.User;

public interface UserDao {
	
	public User getUserInfo(@Param("username") String username);
}
