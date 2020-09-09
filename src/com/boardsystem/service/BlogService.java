package com.boardsystem.service;

import java.util.List;

import com.boardsystem.po.Blog;

public interface BlogService {
	public List<Blog> getTopList();
	
	public Blog getById_Top(int id);
	
	public Blog getById_SE(int id);
	
	List<Blog> getCategoryList_SE(String category);
	
	void addBlog(Blog blog);
	
}
