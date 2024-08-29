package spring.mvc.spring_pj_team2.dao;

import java.util.List;

import spring.mvc.spring_pj_team2.dto.MessageDTO;
import spring.mvc.spring_pj_team2.dto.UserInfoDTO;

public interface UserInfoDAO {

	public int join(UserInfoDTO dto);
	
	public void sendEmail(String email, String key);
	
	public int useridCheck(String strUserId);

	public int selectKey(String key);

	public int updateGrade(String key);

	public UserInfoDTO getUserInfoBySessionID(String userid);

	public int updateMyInfo(UserInfoDTO dto);

	public int deleteMyInfo(String userId);

	public int downGrade(String userid);

	public void sendEmail2(String email, String userid);

	public String getPasswordByUserId(String userId);

	public int selectId(String userid);
	
	public List<MessageDTO> getMessageList(String userid);
	
	public MessageDTO getMessageDetail(int mesNo);

}
