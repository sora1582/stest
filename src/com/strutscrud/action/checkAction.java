package com.strutscrud.action;



import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.strutscrud.dao.Userdao;
import com.strutscrud.dao.impl.UserDaoImpl;
import com.strutscrud.domain.Users;
import com.strutscrud.util.Massages;
/*
 * 
 */
public class checkAction extends ActionSupport implements SessionAware,RequestAware{
/*
 * 
 * (non-Javadoc)
 * @see com.opensymphony.xwork2.ActionSupport#execute()
 */
	//获取用户名密码
	private  String username;
	private String password;
	
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String execute() throws Exception {
		
		Userdao userdao=new UserDaoImpl();
		//传入页面接受的用户名，获取密码
		Users users=userdao.getPassByName(username,password);
		//将页面密码与数据路密码比较
		if(users!=null){
			session.put("users", users);
			session.put("uid", users.getUid());
			session.put("authority", users.getAuthority());
			//登陆成功
			return SUCCESS;
		}else{
			//登录失败
			request.put("msg", Massages.LOGINERROR);
			return LOGIN;
		}
		
	}
	public String logOut(){
		session.remove("username");
		return SUCCESS;
	}
	//定義session對象，session是map類型
private Map<String, Object> session;
//實現sessionaware接口，實現方法
	@Override		//    IOC/DI
	public void setSession(Map<String, Object> arg0) {
		session=arg0;
		
	}
private Map<String, Object> request; 
	@Override
	public void setRequest(Map<String, Object> arg0) {
		request=arg0;
		
	}

}
