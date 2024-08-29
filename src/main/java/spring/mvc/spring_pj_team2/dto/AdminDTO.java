package spring.mvc.spring_pj_team2.dto;

import java.sql.Date;

public class AdminDTO {

	private int adminNo;
	private String adminId;
	private String adminPwd;
	private String name;
	private Date birth;
	private String hp;
	private String address;
	private String email;
	private String key;
	private String authority;
	private String enabled;
	
	public AdminDTO() {
		super();
	}
	
	
	public AdminDTO(int adminNo, String adminId, String adminPwd, String name, Date birth, String hp, String address,
			String email, String key, String authority, String enabled) {
		super();
		this.adminNo = adminNo;
		this.adminId = adminId;
		this.adminPwd = adminPwd;
		this.name = name;
		this.birth = birth;
		this.hp = hp;
		this.address = address;
		this.email = email;
		this.key = key;
		this.authority = authority;
		this.enabled = enabled;
	}


	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPwd() {
		return adminPwd;
	}
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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


	@Override
	public String toString() {
		return "UserInfoDTO [adminNo=" + adminNo + ", adminId=" + adminId + ", adminPwd=" + adminPwd + ", name=" + name
				+ ", birth=" + birth + ", hp=" + hp + ", email=" + email + "]";
	}
}
