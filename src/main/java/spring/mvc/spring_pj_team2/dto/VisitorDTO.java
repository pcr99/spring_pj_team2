package spring.mvc.spring_pj_team2.dto;

import java.sql.Date;

public class VisitorDTO {
    private Date vdate;
    private int visitors1;
    private int visitors2;


    public Date getVdate() {
        return vdate;
    }

	public void setVdate(Date vdate) {
		this.vdate = vdate;
	}

	public int getVisitors1() {
        return visitors1;
    }

    public void setVisitors1(int visitors1) {
        this.visitors1 = visitors1;
    }
    
    public int getVisitors2() {
        return visitors2;
    }

    public void setVisitors2(int visitors2) {
        this.visitors2 = visitors2;
    }
}