package cocktail.board;

import java.util.Objects;

public class BoardBean {
	
	private int no;
	private String event_type;
	private String name;
	private String tel;
	private int participant;
	private String visit_date;
	private String state;
	private String pwd;

	public BoardBean(){}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEvent_type() {
		return event_type;
	}

	public void setEvent_type(String event_type) {
		this.event_type = event_type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getParticipant() {
		return participant;
	}

	public void setParticipant(int participant) {
		this.participant = participant;
	}

	public String getVisit_date() {
		return visit_date;
	}

	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Override
	public String toString() {
		return "BoardBean{" +
				"no=" + no +
				", event_type='" + event_type + '\'' +
				", name='" + name + '\'' +
				", tel='" + tel + '\'' +
				", participant=" + participant +
				", visit_date='" + visit_date + '\'' +
				", state='" + state + '\'' +
				", pwd='" + pwd + '\'' +
				'}';
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		BoardBean boardBean = (BoardBean) o;
		return no == boardBean.no && participant == boardBean.participant && Objects.equals(event_type, boardBean.event_type) && Objects.equals(name, boardBean.name) && Objects.equals(tel, boardBean.tel) && Objects.equals(visit_date, boardBean.visit_date) && Objects.equals(state, boardBean.state) && Objects.equals(pwd, boardBean.pwd);
	}

	@Override
	public int hashCode() {
		return Objects.hash(no, event_type, name, tel, participant, visit_date, state, pwd);
	}
}
