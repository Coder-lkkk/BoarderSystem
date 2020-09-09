package com.boardsystem.utils;

public interface RedisBaseOperate {
	public void add(String key,String value);
	public void addObj(String key,Object value);
	
	public void delete(String key);
	public void deleteObj(String key);
	
	public Object get(String key);
	public void getObj(String key);
	
	public void update(String key,String value);
	public void updateObj(String key,String value);

}
