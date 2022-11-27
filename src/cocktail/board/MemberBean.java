package cocktail.board;

import java.util.Objects;

public class MemberBean {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String tel;

	public MemberBean () {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		MemberBean that = (MemberBean) o;
		return Objects.equals(id, that.id) && Objects.equals(pwd, that.pwd) && Objects.equals(name, that.name) && Objects.equals(email, that.email) && Objects.equals(tel, that.tel);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, pwd, name, email, tel);
	}
}
