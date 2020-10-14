package kr.co.greentable.user.vo;

public class OrderPageRangeVO {
	private int startNum, endNum;
	
	public OrderPageRangeVO() {
	}

	public OrderPageRangeVO(int startNum, int endNum) {
		this.startNum = startNum;
		this.endNum = endNum;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
	
}//class
