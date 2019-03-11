package com.yc.servlet;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String[] y0 = {};
		String[] y1 = {"上海","北京","湖北"};
		String[] y2 = {"管理学"};
		String[] y3 = {"西安交通大学","武汉大学"};
		
		String[] res = new String[16];
		res=Users.recommend("理科", "陕西","第一批", 653, y1, y0,y0);
		for(int i=0;i<16;i++){
			System.out.println(res[i]);
		}
	}
}
