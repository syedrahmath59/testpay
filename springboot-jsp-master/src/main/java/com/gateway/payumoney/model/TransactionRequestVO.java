package com.gateway.payumoney.model;

import java.util.Date;

public class TransactionRequestVO {
	
	/*private String msisdn;
	private String serviceId;
	private String cpId;
	private String contentId;
	private String transactionId;
	private Date transactionTime;*/
	
	private String amount;
	private String firstname;
	private String email;
	private String productinfo;
	private String merchantTid;
	private String phone;
	
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProductinfo() {
		return productinfo;
	}
	public void setProductinfo(String productinfo) {
		this.productinfo = productinfo;
	}
	public String getMerchantTid() {
		return merchantTid;
	}
	public void setMerchantTid(String merchantTid) {
		this.merchantTid = merchantTid;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	/*public String getMsisdn() {
		return msisdn;
	}
	public void setMsisdn(String msisdn) {
		this.msisdn = msisdn;
	}
	public String getServiceId() {
		return serviceId;
	}
	public void setServiceId(String serviceId) {
		this.serviceId = serviceId;
	}
	public String getCpId() {
		return cpId;
	}
	public void setCpId(String cpId) {
		this.cpId = cpId;
	}
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public Date getTransactionTime() {
		return transactionTime;
	}
	public void setTransactionTime(Date transactionTime) {
		this.transactionTime = transactionTime;
	}*/
	
	

}
