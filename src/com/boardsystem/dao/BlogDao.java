package com.boardsystem.dao;

import java.util.List;

import com.boardsystem.po.Blog;

public interface BlogDao {
	
	List<Blog> getTopList();
	
	List<Blog> getCategoryList_SE(String category);
	
	Blog getById_Top(int id);
	
	Blog getById_SE(int id);
	
	void addBlog(Blog blog);
	
}
