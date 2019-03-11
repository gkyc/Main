package com.yc.servlet;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;


public class Users {
	
	public static String[] recommend(String sub,String pro,String batch,int mark,String[] ideal_pro,String[] major,String...sch){
		String[] res_sch = new String[16];
		ArrayList<String> tmp1 = new ArrayList<String>();
	    if(ideal_pro.length==0||major.length==0){
	    	//预测学校方法10
	    	String[] school = recommendSchool(sub, pro, mark, sch);
	    	for(int i=0;i<10;i++){
    			tmp1.add(probability_pro(sub,pro,batch,mark,school[i]));
    		}
	    	if(ideal_pro.length!=0&&major.length==0){
	    		if(ideal_pro.length==1){
	    			String[] tt=recommend_pro(sub,pro,batch,mark,ideal_pro[0]);
		    		for(int i=0;i<6;i++){
		    			tmp1.add(tt[i]);
		    		}
		        }else if(ideal_pro.length==2){
		        	String[] tt=recommend_pro(sub,pro,batch,mark,ideal_pro[0]);
		    		for(int i=0;i<3;i++){
		    			tmp1.add(tt[i+2]);
		    		}
		    		String[] tt1=recommend_pro(sub,pro,batch,mark,ideal_pro[1]);
		    		for(int i=0;i<3;i++){
		    			tmp1.add(tt1[i+2]);
		    		}
		        }else if(ideal_pro.length==3){
		        	String[] tt=recommend_pro(sub,pro,batch,mark,ideal_pro[0]);
		    		for(int i=0;i<2;i++){
		    			tmp1.add(tt[i+2]);
		    		}
		    		String[] tt1=recommend_pro(sub,pro,batch,mark,ideal_pro[1]);
		    		for(int i=0;i<2;i++){
		    			tmp1.add(tt1[i+2]);
		    		}
		    		String[] tt2=recommend_pro(sub,pro,batch,mark,ideal_pro[2]);
		    		for(int i=0;i<2;i++){
		    			tmp1.add(tt2[i+2]);
		    		}
		    	}
	    	}
            if(ideal_pro.length==0&&major.length!=0){
            	if(major.length==1){
            		String[] tt=recommend_major(sub,pro,batch,mark,major[0]);
                	for(int i=0;i<6;i++){
                		tmp1.add(tt[i]);
    	    		}
    	    	}else if(major.length==2){
    	    		String[] tt=recommend_major(sub,pro,batch,mark,major[0]);
    	    		for(int i=0;i<3;i++){
    	    			tmp1.add(tt[i+2]);
    	    		}
    	    		String[] tt1=recommend_major(sub,pro,batch,mark,major[1]);
    	    		for(int i=0;i<3;i++){
    	    			tmp1.add(tt1[i+2]);
    	    		}
    	    	}else if(major.length==3){
    	    		String[] tt=recommend_major(sub,pro,batch,mark,major[0]);
    	    		for(int i=0;i<2;i++){
    	    			tmp1.add(tt[i+2]);
    	    		}
    	    		String[] tt1=recommend_major(sub,pro,batch,mark,major[1]);
    	    		for(int i=0;i<2;i++){
    	    			tmp1.add(tt1[i+2]);
    	    		}
    	    		String[] tt2=recommend_major(sub,pro,batch,mark,major[2]);
    	    		for(int i=0;i<2;i++){
    	    			tmp1.add(tt2[i+2]);
    	    		}
    	    	}
	    	}
	    }else{
	    	if(ideal_pro.length==1){
	    		String[] tt=recommend_pro(sub,pro,batch,mark,ideal_pro[0]);
		    	for(int i=0;i<6;i++){
		    		tmp1.add(tt[i]);
		    	}
		    }else if(ideal_pro.length==2){
		    	String[] tt=recommend_pro(sub,pro,batch,mark,ideal_pro[0]);
		    	for(int i=0;i<3;i++){
		    		tmp1.add(tt[i+2]);
	    		}
		    	String[] tt1=recommend_pro(sub,pro,batch,mark,ideal_pro[1]);
	    		for(int i=0;i<3;i++){
	    			tmp1.add(tt1[i+2]);
	    		}
		    }else if(ideal_pro.length==3){
		    	String[] tt=recommend_pro(sub,pro,batch,mark,ideal_pro[0]);
		    	for(int i=0;i<2;i++){
		    		tmp1.add(tt[i+2]);
	    		}
		    	String[] tt1=recommend_pro(sub,pro,batch,mark,ideal_pro[1]);
	    		for(int i=0;i<2;i++){
	    			tmp1.add(tt1[i+2]);
	    		}
	    		String[] tt2=recommend_pro(sub,pro,batch,mark,ideal_pro[2]);
	    		for(int i=0;i<2;i++){
	    			tmp1.add(tt2[i+2]);
	    		}
		    }
		    if(major.length==1){
		    	String[] tt=recommend_major(sub,pro,batch,mark,major[0]);
	            for(int i=0;i<6;i++){
	            	tmp1.add(tt[i]);
		    	}
		    }else if(major.length==2){
		    	String[] tt=recommend_major(sub,pro,batch,mark,major[0]);
		    	for(int i=0;i<3;i++){
		    		tmp1.add(tt[i+2]);
		    	}
		    	String[] tt1=recommend_major(sub,pro,batch,mark,major[1]);
		    	for(int i=0;i<3;i++){
		    		tmp1.add(tt1[i+2]);
		    	}
		    }else if(major.length==3){
		    	String[] tt=recommend_major(sub,pro,batch,mark,major[0]);
		    	for(int i=0;i<2;i++){
		    		tmp1.add(tt[i+2]);
		    	}
		    	String[] tt1=recommend_major(sub,pro,batch,mark,major[1]);
		    	for(int i=0;i<2;i++){
		    		tmp1.add(tt1[i+2]);
		    	}
		    	String[] tt2=recommend_major(sub,pro,batch,mark,major[2]);
		    	for(int i=0;i<2;i++){
		    		tmp1.add(tt2[i+2]);
		    	}
		    }
	    }
	    for (int i = 0; i <tmp1.size(); i++){
			res_sch[i]=tmp1.get(i);
		}
		return res_sch;
	}
	public static String[] recommend_pro(String sub,String pro,String batch,int mark,String ideal_pro){
		String[] fore_sch=new String[6];
		Connection conn=ConData.getConnection();
	    Statement stat;
	    ResultSet rs;
	    ArrayList<String> tmp = new ArrayList<String>();
	    try {
			stat = conn.createStatement();
	        rs=stat.executeQuery("select sch_name from school where sch_province='"+ideal_pro+"' order by sch_proranking asc");
			while (rs.next()) {
				tmp.add(rs.getString(1));
			}
			if(tmp.size()<7){
				for (int i = 0; i <tmp.size(); i++){
					fore_sch[i]=tmp.get(i);
				}
			}else{
				for (int i = 0; i <tmp.size(); i++) {
					rs=stat.executeQuery("select mark from forecast_mark where school='"+tmp.get(i)+"'and province='"+pro+"' and subject='"+sub+"' and batch='"+batch+"'");
					while (rs.next()) {
						if(mark>=rs.getInt(1)){
							if(i>2&&i<tmp.size()-2){
								for (int j = 0; j <6; j++){
									fore_sch[j]=tmp.get(i-3+j);
								}
							}else if(i<=2){
								for (int j = 0; j <6; j++){
									fore_sch[j]=tmp.get(j);
								}
							}else if(i>=tmp.size()-2){
								for (int j = 0; j <6; j++){
									fore_sch[j]=tmp.get(tmp.size()-6+j);
								}
							}
							i=tmp.size();
						}
					}
				}
				if(fore_sch[0]==null){
					for (int i = 0; i <6; i++){
						fore_sch[i]=tmp.get(tmp.size()-6+i);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConData.closeConnection(conn);
		}
	    for (int i = 0; i <6; i++){
	    	fore_sch[i]=probability_pro(sub,pro,batch,mark,fore_sch[i]);
		}
		return fore_sch;
		
	}
	public static String[] recommend_major(String sub,String pro,String batch,int mark,String major){
		String[] fore_sch=new String[6];
		Connection conn=ConData.getConnection();
	    Statement stat;
	    ResultSet rs;
	    ArrayList<String> tmp = new ArrayList<String>();
	    try {
			stat = conn.createStatement();
	        rs=stat.executeQuery("select school from lar_maj_rank where large_major='"+major+"' order by ranking asc");
			while (rs.next()) {
				tmp.add(rs.getString(1));
			}
			if(tmp.size()<7){
				for (int j = 0; j <tmp.size(); j++){
					fore_sch[j]=tmp.get(j);
				}
			}else{
				for (int i = 0; i <tmp.size(); i++) {
					rs=stat.executeQuery("select mark from forecast_large_major_mark where large_major='"+major+"' and school='"+tmp.get(i)+"'and province='"+pro+"' and subject='"+sub+"' and batch='"+batch+"'");
					while (rs.next()) {
						if(mark-rs.getInt(1)>=0){
							if(i>2&&i<tmp.size()-2){
								for (int j = 0; j <6; j++){
									fore_sch[j]=tmp.get(i-3+j);
								}
							}else if(i<=2){
								for (int j = 0; j <6; j++){
									fore_sch[j]=tmp.get(j);
								}
							}else if(i>=tmp.size()-2){
								for (int j = 0; j <6; j++){
									fore_sch[j]=tmp.get(tmp.size()-6+j);
								}
							}
							i=tmp.size();
						}
					}
				}
				if(fore_sch[0]==null){
					for (int j = 0; j <6; j++){
						fore_sch[j]=tmp.get(tmp.size()-6+j);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConData.closeConnection(conn);
		}
	    for (int i = 0; i <6; i++){
	    	fore_sch[i]=probability_major(sub,pro,batch,mark,major,fore_sch[i]);
		}
		return fore_sch;
		
	}
	
	public static String probability_pro(String sub,String pro,String batch,int mark,String school){
		String probability;
		String[] probably=new String[2];
		float p=0;
		Connection conn=ConData.getConnection();
	    Statement stat;
	    ResultSet rs;
	    if(school==null){
	    	school="输入学校为空";
	    	probably[1]="";
	    }else{
	    	try{
		    	stat = conn.createStatement();
		        rs=stat.executeQuery("select * from forecast_mark where school='"+school+"'and province='"+pro+"' and subject='"+sub+"' and batch='"+batch+"'");
		        while (rs.next()) {
		        	p=rs.getFloat(7);
					if(mark-rs.getInt(8)>=-5&&mark-rs.getInt(8)<=5){
						p=p-0.2f;
					}else if(rs.getInt(8)-mark>5){
						int x=(rs.getInt(8)-mark+4)/5;
						p=p-x*0.2f;
						if(p<=0)p=0.01f;
					}
				}
		    }catch (SQLException e) {
				e.printStackTrace();
			}finally{
				ConData.closeConnection(conn);
			}
	    	if(p==0)probably[1]="数据缺失";else probably[1]=p+"";
	    }
		probably[0]=school;
		probability=probably[0]+" "+probably[1];
		return probability;
	}
	public static String probability_major(String sub,String pro,String batch,int mark,String major,String school){
		String probability;
		String[] probably=new String[2];
		float p=0;
		Connection conn=ConData.getConnection();
	    Statement stat;
	    ResultSet rs;
	    if(school==null){
	    	school="输入学校为空";
	    	probably[1]="";
	    }else{
	    	try{
		    	stat = conn.createStatement();
		        rs=stat.executeQuery("select * from forecast_large_major_mark where large_major='"+major+"'and school='"+school+"'and province='"+pro+"' and subject='"+sub+"' and batch='"+batch+"'");
		        while (rs.next()) {
		        	p=rs.getFloat(8);
					if(mark-rs.getInt(9)>=-5&&mark-rs.getInt(9)<=5){
						p=p-0.2f;
					}else if(rs.getInt(9)-mark>5){
						int x=(rs.getInt(9)-mark+4)/5;
						p=p-x*0.2f;
						if(p<=0)p=0.01f;
					}
				}
		    }catch (SQLException e) {
				e.printStackTrace();
			}finally{
				ConData.closeConnection(conn);
			}
	    	if(p==0)probably[1]="数据缺失";else probably[1]=p+"";
	    }
		probably[0]=school;
		probability=probably[0]+" "+probably[1];
		return probability;
	}
    
	@SuppressWarnings("resource")
	public static String[] recommendSchool(String sub, String pro, int mar, String...sch){
		String[] school = new String [10];
		int[] id= new int [10];
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = ConData.getConnection();
		String sql="select * from forecast_mark where forecast_mark.mark = " + mar 
				+ " and forecast_mark.subject = '" + sub + "'"
				+ " and forecast_mark.province = '" + pro + "'";
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery(sql);
			while(!rs.next()){
				mar--;
				sql="select * from forecast_mark where forecast_mark.mark = " + mar 
						+ " and forecast_mark.subject = '" + sub + "'"
						+ " and forecast_mark.province = '" + pro + "'";
				pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery(sql);
			}
			school[0] = rs.getString("school");				
			id[0] = rs.getInt("mark_id");
			int sl = 1;
			while(rs.next() & sl < 10){				
				school[sl] = rs.getString("school");
				id[sl++] = rs.getInt("mark_id");									
			}
			if(sl != 10){
				int tmp1 = id[sl-1]+(11-sl)/2;
				int tmp2 = id[0]-(10-sl)/2;
				if(tmp2 < 1) tmp1 = tmp1-tmp2 + 1;
				sql = "select * from forecast_mark where (forecast_mark.mark_id <= " + tmp1 + " and forecast_mark.mark_id > " + id[sl-1] + ") or "
						 + "( forecast_mark.mark_id >= " + tmp2 + " and forecast_mark.mark_id < " + id[0] + ")";
				pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery(sql);
				while(rs.next() & sl < 10){
					school[sl] = rs.getString("school");
					id[sl++] = rs.getInt("mark_id");
				}
			}
			int sc [] = new int[sch.length];
			int sc1 [] = new int[10];
			for(int i = 0; i < sch.length; i++){
				for(int j = 0; j <10 ;j++){
					if(sch[i].equals(school[j])) {
						sc1[j] = 1;
						sc[i] = 1;
						break;
						
					}					
				}
				if(sc[i]!=1) {
					for(int j = 9; j >= 0; j--){
						if (sc1[j] != 1) {
							school[j] = sch[i];
							sc1[j] = 1;
							break;
						}
					}									
				}
			}
			
				
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ConData.closeConnection(conn);		
		return school;		
	}	


}
