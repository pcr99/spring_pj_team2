package spring.mvc.spring_pj_team2.dto;

import java.sql.Date;

public class UserInfoDTO {

	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private Date birth;
	private String hp;
	private String address;
	private String email;
	private Date createDate;
	private String show;
	private String key;
	private String authority;
	private String enabled;
	
	public UserInfoDTO() {
		super();
	}

	public UserInfoDTO(int userNo, String userId, String userPwd, String userName, Date birth, String hp, String address,
			String email, Date createDate, String show, String key, String authority, String enabled) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birth = birth;
		this.hp = hp;
		this.address = address;
		this.email = email;
		this.createDate = createDate;
		this.show = show;
		this.key = key;
		this.authority = authority;
		this.enabled = enabled;
	}

	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "UserInfoDTO [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName="
				+ userName + ", birth=" + birth + ", hp=" + hp + ", address=" + address + ", email=" + email
				+ ", createDate=" + createDate + ", show=" + show + ", key=" + key + ", authority=" + authority
				+ ", enabled=" + enabled + "]";
	}


}
