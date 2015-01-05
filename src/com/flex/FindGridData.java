package com.flex;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

public class FindGridData {

	public String findData(){
		//  http://javacrazyer.iteye.com/blog/708463#
		System.out.println("执行我了。。。。。。。。。。。。。。。");
		List<MyObject> orgData=new ArrayList<MyObject>();
		for(int x= 1; x <= 555; x++ )
		{
			MyObject ob=new MyObject();
			ob.setId("CHENEY"+x);
	        ob.setCode("HENAN"+x);
			ob.setTotal(x*10);
			ob.setCustomer("CUS"+x);
			ob.setRegister("EMP");
            ob.setMemo("MEMO"+x);
			ob.setState("STATE");
			orgData.add(ob);
		}
		 JSONArray json=JSONArray.fromObject(orgData);
		   String datas=json.toString();
		   System.out.println(datas);
	  return datas;
	}
	
}
