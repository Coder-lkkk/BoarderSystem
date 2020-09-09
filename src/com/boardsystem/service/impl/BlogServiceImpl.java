package com.boardsystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boardsystem.dao.BlogDao;
import com.boardsystem.po.Blog;
import com.boardsystem.service.BlogService;

@Service("blogService")
@Transactional
public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogDao blogDao;
    
	@Override
	public List<Blog> getTopList() {
		return this.blogDao.getTopList();
	}
	
	@Override
	public Blog getById_Top(int id) {
		return this.blogDao.getById_Top(id);
	}
	
	@Override
	public Blog getById_SE(int id) {
		return this.blogDao.getById_SE(id);
	}
	
	@Override
	public List<Blog> getCategoryList_SE(String category) {
		return this.blogDao.getCategoryList_SE(category);
	}
	
	@Override
	public void addBlog(Blog blog) {
		this.blogDao.addBlog(blog);
	}
	
}
