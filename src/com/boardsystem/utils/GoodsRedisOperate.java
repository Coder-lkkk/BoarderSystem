package com.boardsystem.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

@Component("GoodsRedisOperate")
public class GoodsRedisOperate implements RedisBaseOperate {
/*	@Resource(name="redisTemplate")
    private RedisTemplate redisTemplate;*/
	ApplicationContext aplict = new ClassPathXmlApplicationContext("spring-redis.xml");
	RedisTemplate redisTemplate = (RedisTemplate) aplict.getBean("redisTemplate");

	@Override
	public void add(String key, String value) {
		if(redisTemplate==null){
			System.out.println("redisTemplate实例化失败");
			return ;
		}else{
			redisTemplate.opsForValue().set(key, value);
		}

	}

	@Override
	public void addObj(String key, Object value) {
		if(redisTemplate==null){
			System.out.println("redisTemplate实例化失败");
			return ;
		}else{
			redisTemplate.opsForValue().set(key,value);
		}
	}

	@Override
	public void delete(String key) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteObj(String key) {
		// TODO Auto-generated method stub

	}

	@Override
	public String get(String key) {
		String result = null;
		if(redisTemplate==null){
			System.out.println("redisTemplate实例化失败");
		}else{
			result = (String) redisTemplate.opsForValue().get(key);
		}
		return result;
	}

	@Override
	public void getObj(String key) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(String key, String value) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateObj(String key, String value) {
		// TODO Auto-generated method stub

	}

}
