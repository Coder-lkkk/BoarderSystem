package com.boardsystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boardsystem.utils.GoodsRedisOperate;

@Controller
@RequestMapping(value = "/redis")
public class RedisController {
	private final GoodsRedisOperate gdo = new GoodsRedisOperate();
	
	@RequestMapping(value = "/addKey.action")
	public void addKey() {
		System.out.println("111111111111111111111111111");
		gdo.add("testRedisSSM","success");
	}
	
//	@RequestMapping(value = "/addGoods.action")
//	public void addGoods() {
//		List<Goods> list ;
//		Goods good1 = new Goods("1","127.0.0.1","");
//		list.add()
//	}
	
	@RequestMapping(value = "/getKey.action")
	public void getKey() {
		System.out.println(gdo.get("testRedisSSM"));
	}
}
