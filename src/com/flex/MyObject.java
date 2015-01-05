package com.flex;

public class MyObject {
	String Id;
	String Code;
	int Total;
	String Customer;
	String Register;
	String Memo;
	String State;

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getCode() {
		return Code;
	}

	public void setCode(String code) {
		Code = code;
	}

	public int getTotal() {
		return Total;
	}

	public void setTotal(int total) {
		Total = total;
	}

	public String getCustomer() {
		return Customer;
	}

	public void setCustomer(String customer) {
		Customer = customer;
	}

	public String getRegister() {
		return Register;
	}

	public void setRegister(String register) {
		Register = register;
	}

	public String getMemo() {
		return Memo;
	}

	public void setMemo(String memo) {
		Memo = memo;
	}

	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

	public MyObject(String id, String code, int total, String customer,
			String register, String memo, String state) {
		super();
		Id = id;
		Code = code;
		Total = total;
		Customer = customer;
		Register = register;
		Memo = memo;
		State = state;
	}

	public MyObject() {
		super();
	}

}
