package Test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.junit.Test;

import com.xzy.bean.Admin;
import com.xzy.db.core.DBManager;

public class Test02 {

	
	@Test
	public static void main(String[] args) throws SQLException {
		Admin admin=new Admin();
		admin.setEmail("222244@qq.com");
		admin.setId(new Long(45));
		admin.setUpwd("2111");
		admin.setUpur("1213313");
		/*TreeMap<String, Object> map=DBManager.parseAllField(admin);
	    for(Map.Entry<String, Object> entry:map.entrySet()) {
	    	System.out.println("key:"+entry.getKey()+",value:"+entry.getValue());
	    }
	    
	    StringBuilder sb=null;
	    List<Object> lists=null;
	    DBManager.parseFildAndQuery(sb, lists, map);
	    System.out.println(sb.toString()+lists.toString());*/
	    
        //DBManager.add(admin);
		
		Admin adm=DBManager.get(18L, Admin.class);
		System.out.println(adm.getId()+"\t"+adm.getEmail()+"\t"+adm.getUpur());
	    ArrayList<Admin> lists=(ArrayList<Admin>) DBManager.getAll(Admin.class);
	    for(Admin ad:lists) {
	    	System.out.println(ad.getId()+"\t"+ad.getEmail()+"\t"+ad.getUpur());
	    }
	    DBManager.delete(19L, Admin.class);
	} 
	
}
