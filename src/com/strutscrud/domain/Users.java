package com.strutscrud.domain;

public class Users {
	private Integer uid;
	private String username;
	private String password;
	private Integer authority;

	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String i) {
		this.username = i;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getAuthority() {
		return authority;
	}
	public void setAuthority(int string) {
		this.authority = string;
	}
	@Override
	public String toString() {
		return "Users [uid=" + uid + ", username=" + username + ", password=" + password + ", authority=" + authority
				+ "]";
	}
	

	
}
