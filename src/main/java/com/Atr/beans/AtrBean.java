package com.Atr.beans;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component

public class AtrBean {
	
	private String Atrid;
	private String DomainName;
	private String IssuedBy;
	private String ActionItems;
    private String Updates;
	private String Status;
	
	
	private String TargetDate;
	private String EntryDate;
	private String EntryBy;
	
	
	public String getAtrid() {
		return Atrid;
	}
	public void setAtrid(String atrid) {
		Atrid = atrid;
	}
	
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getTargetDate() {
		return TargetDate;
	}
	public void setTargetDate(String targetDate) {
		TargetDate = targetDate;
	}
	public String getDomainName() {
		return DomainName;
	}
	public void setDomainName(String domainName) {
		 DomainName = domainName;
	}
	public String getIssuedBy() {
		return IssuedBy;
	}
	public void setIssuedBy(String issuedBy) {
		IssuedBy = issuedBy;
	}
	public String getActionItems() {
		return ActionItems;
	}
	public void setActionItems(String actionItems) {
		ActionItems = actionItems;
	}
	
	
	public String getUpdates() {
		return Updates;
	}
	public void setUpdates(String updates) {
		Updates = updates;
	}
	
	public String getEntryDate() {
		return EntryDate;
	}
	public void setEntryDate(String entryDate) {
		EntryDate = entryDate;
	}
	public String getEntryBy() {
		return EntryBy;
	}
	public void setEntryBy(String entryBy) {
		EntryBy = entryBy;
	}
	
}
