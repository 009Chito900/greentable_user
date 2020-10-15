package kr.co.greentable.user.vo;

/**
 * 상품 받으시는 분 정보 (이름, 휴대폰번호, 주소, 카드종류, 카드번호, 만료일: 년,월, 주문번호) 
 * @author sist27
 *
 */
public class ReceiverVO {
	
	private String receiver_name, receiver_phone, receiver_addr1, receiver_addr2, receiver_zipcode,
					bank, credit_num, expiration_month, expiration_year, order_num, id;
	
	public ReceiverVO() {
	}

	public String getReceiver_name() {
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public String getReceiver_phone() {
		return receiver_phone;
	}

	public void setReceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
	}

	public String getReceiver_addr1() {
		return receiver_addr1;
	}

	public void setReceiver_addr1(String receiver_addr1) {
		this.receiver_addr1 = receiver_addr1;
	}

	public String getReceiver_addr2() {
		return receiver_addr2;
	}

	public void setReceiver_addr2(String receiver_addr2) {
		this.receiver_addr2 = receiver_addr2;
	}

	public String getReceiver_zipcode() {
		return receiver_zipcode;
	}

	public void setReceiver_zipcode(String receiver_zipcode) {
		this.receiver_zipcode = receiver_zipcode;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getCredit_num() {
		return credit_num;
	}

	public void setCredit_num(String credit_num) {
		this.credit_num = credit_num;
	}

	public String getExpiration_month() {
		return expiration_month;
	}

	public void setExpiration_month(String expiration_month) {
		this.expiration_month = expiration_month;
	}

	public String getExpiration_year() {
		return expiration_year;
	}

	public void setExpiration_year(String expiration_year) {
		this.expiration_year = expiration_year;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ReceiverVO(String receiver_name, String receiver_phone,
			String receiver_addr1, String receiver_addr2,
			String receiver_zipcode, String bank, String credit_num,
			String expiration_month, String expiration_year, String order_num,
			String id) {
		this.receiver_name = receiver_name;
		this.receiver_phone = receiver_phone;
		this.receiver_addr1 = receiver_addr1;
		this.receiver_addr2 = receiver_addr2;
		this.receiver_zipcode = receiver_zipcode;
		this.bank = bank;
		this.credit_num = credit_num;
		this.expiration_month = expiration_month;
		this.expiration_year = expiration_year;
		this.order_num = order_num;
		this.id = id;
	}
	
}//class
