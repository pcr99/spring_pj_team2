package spring.mvc.spring_pj_team2.dto;

// 게시판 댓글 DTO
public class MessageDTO {

	private int messageNo;			//pk, 댓글 일련번호
	private String userId;				//FK, 게시글 번호
	private String messageTitle;
	private String messageContent;
	
	public MessageDTO() {
		super();
	}
	public MessageDTO(int messageNo, String userId, String messageTitle, String messageContent) {
		super();
		this.messageNo = messageNo;
		this.userId = userId;
		this.messageTitle = messageTitle;
		this.messageContent = messageContent;
	}
	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}


	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMessageTitle() {
		return messageTitle;
	}

	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	@Override
	public String toString() {
		return "messageDTO [messageNo=" + messageNo + ", userNo=" + userId + ", messageTitle=" + messageTitle
				+ ", messageContent=" + messageContent + "]";
	}
	
	
	
}
