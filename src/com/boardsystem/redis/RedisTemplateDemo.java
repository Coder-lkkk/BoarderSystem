package com.boardsystem.redis;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.RedisTemplate;

import com.boardsystem.po.Good;

public class RedisTemplateDemo {

	public void redisTemplate(){
		
		ApplicationContext context =
	            new ClassPathXmlApplicationContext("spring-redis.xml");
	    RedisTemplate redisTemplate = context.getBean(RedisTemplate.class);
	    
	    Good good = new Good("book","127.0.0.1",new Date());
	    System.out.println("准备写入:"+good);
	    redisTemplate.opsForValue().set("goods_1",good);
	    
	    Good good_1 = (Good) redisTemplate.opsForValue().get("goods_1");
	    System.out.println("取出"+good_1);
	}
}
