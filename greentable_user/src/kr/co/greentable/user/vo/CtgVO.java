package kr.co.greentable.user.vo;

public class CtgVO {
	private String flag,sub_flag;

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getSub_flag() {
		return sub_flag;
	}

	public void setSub_flag(String sub_flag) {
		this.sub_flag = sub_flag;
	}

	@Override
	public String toString() {
		return "CtgVO [flag=" + flag + ", sub_flag=" + sub_flag + "]";
	}
	
	
}
