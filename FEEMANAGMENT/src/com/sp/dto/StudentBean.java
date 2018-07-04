package com.sp.dto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.mysql.jdbc.ResultSetMetaData;

public class StudentBean {
	public List resultSetToArrayList(ResultSet rs) throws SQLException{
		  ResultSetMetaData md = (ResultSetMetaData) rs.getMetaData();
		  int columns = md.getColumnCount();
		  ArrayList list = new ArrayList(50);
		  while (rs.next()){
		     HashMap row = new HashMap(columns);
		     for(int i=1; i<=columns; ++i){           
		      row.put(md.getColumnName(i),rs.getObject(i));
		     }
		      list.add(row);
		  }

		 return list;
		}

}
