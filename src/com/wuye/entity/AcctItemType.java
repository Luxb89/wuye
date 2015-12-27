package com.wuye.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * AcctItemType entity. @author MyEclipse Persistence Tools
 */

public class AcctItemType extends BaseEntity implements java.io.Serializable {

	// Fields

	private Integer acctItemTypeId;
	private String acctTypeName;
	private String acctType;
	private Integer parentAcctTypeId;
	private String classId;
	private Integer objId;
	private Set acctItemRels = new HashSet(0);
	private Set extraordinaryFees = new HashSet(0);

	// Constructors

	/** default constructor */
	public AcctItemType() {
	}

	/** full constructor */
	public AcctItemType(String acctTypeName, String acctType,
			Integer parentAcctTypeId, String classId, Integer objId,
			Timestamp createDate, Timestamp updateDate, String statusCd,
			Timestamp statusDate, Set acctItemRels, Set extraordinaryFees) {
		this.acctTypeName = acctTypeName;
		this.acctType = acctType;
		this.parentAcctTypeId = parentAcctTypeId;
		this.classId = classId;
		this.objId = objId;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.statusCd = statusCd;
		this.statusDate = statusDate;
		this.acctItemRels = acctItemRels;
		this.extraordinaryFees = extraordinaryFees;
	}

	// Property accessors

	public Integer getAcctItemTypeId() {
		return super.getId();
	}

	public void setAcctItemTypeId(Integer acctItemTypeId) {
		super.setId(acctItemTypeId);
	}

	public String getAcctTypeName() {
		return this.acctTypeName;
	}

	public void setAcctTypeName(String acctTypeName) {
		this.acctTypeName = acctTypeName;
	}

	public String getAcctType() {
		return this.acctType;
	}

	public void setAcctType(String acctType) {
		this.acctType = acctType;
	}

	public Integer getParentAcctTypeId() {
		return this.parentAcctTypeId;
	}

	public void setParentAcctTypeId(Integer parentAcctTypeId) {
		this.parentAcctTypeId = parentAcctTypeId;
	}

	public String getClassId() {
		return this.classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public Integer getObjId() {
		return this.objId;
	}

	public void setObjId(Integer objId) {
		this.objId = objId;
	}

	public Set getAcctItemRels() {
		return this.acctItemRels;
	}

	public void setAcctItemRels(Set acctItemRels) {
		this.acctItemRels = acctItemRels;
	}

	public Set getExtraordinaryFees() {
		return this.extraordinaryFees;
	}

	public void setExtraordinaryFees(Set extraordinaryFees) {
		this.extraordinaryFees = extraordinaryFees;
	}

}