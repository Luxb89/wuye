package com.wuye.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import lombok.Getter;
import lombok.Setter;

import com.wuye.constants.BaseConstants;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User extends BaseEntity implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String account;
	private String pwd;
	private String userType;
	private Set userAuths = new HashSet(0);
	private Set complaintDeals = new HashSet(0);
	private Set userOrgRels = new HashSet(0);
	@Getter
	@Setter
	private PropertyCompany ownerCompany;
	
	private PartyInfo partyInfo;
	@Getter
	@Setter
	private String opendId;
	@Getter
	@Setter
	private String opendTime;
	// Constructors
	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String account, String pwd, String userType) {
		this.account = account;
		this.pwd = pwd;
		this.userType = userType;
	}

	/** full constructor */
	public User(String account, String pwd, String userType, String statusCd,
			Timestamp createDate, Timestamp statusDate, Timestamp updateDate,
			Set userAuths, Set complaintDeals, Set userOrgRels) {
		this.account = account;
		this.pwd = pwd;
		this.userType = userType;
		this.statusCd = statusCd;
		this.createDate = createDate;
		this.statusDate = statusDate;
		this.updateDate = updateDate;
		this.userAuths = userAuths;
		this.complaintDeals = complaintDeals;
		this.userOrgRels = userOrgRels;
	}

	// Property accessors

	public Integer getUserId() {
		return super.getId();
	}

	public void setUserId(Integer userId) {
		super.setId(userId);
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getUserType() {
		return this.userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Set getUserAuths() {
		return this.userAuths;
	}

	public void setUserAuths(Set userAuths) {
		this.userAuths = userAuths;
	}

	public Set getComplaintDeals() {
		return this.complaintDeals;
	}

	public void setComplaintDeals(Set complaintDeals) {
		this.complaintDeals = complaintDeals;
	}

	public Set getUserOrgRels() {
		return this.userOrgRels;
	}

	public void setUserOrgRels(Set userOrgRels) {
		this.userOrgRels = userOrgRels;
	}
	
	/*public PropertyCompany getOwnerCompany(){
		if (this.isLoaded("ownerCompany", this.ownerCompany)){
			return this.ownerCompany;
		}
		if (this.getUserOrgRels() != null && this.getUserOrgRels().size() > 0){
			List<UserOrgRel> userOrgs = new ArrayList<UserOrgRel>(this.getUserOrgRels());
			if (userOrgs.get(0).getOrganization() == null){
				this.ownerCompany = null;
				this.Loaded("ownerCompany");
				return this.ownerCompany;
			}else{
				Organization org = userOrgs.get(0).getOrganization();
				this.ownerCompany = org.getOwnerCompany();
				this.Loaded("ownerCompany");
				return this.ownerCompany;
			}
		}else{
			this.ownerCompany = null;
			this.Loaded("ownerCompany");
			return this.ownerCompany;
		}
		
	}*/
	
	public PartyInfo getPartyInfo(){
		if (this.isLoaded("partyInfo", this.partyInfo)){
			return this.partyInfo;
		}
		String hql = "select a from PartyInfo a where a.classId=? and a.objId = ? and a.statusCd=? ";
		List<Object> params = new ArrayList<Object>();
		params.add(BaseConstants.CLASS_USER);
		params.add(this.getId());
		params.add(BaseConstants.STATUS_VALID);
		List<PartyInfo> rets = super.getDefaultDao().findListByHQLAndParams(hql, params);
		if (rets != null && rets.size() > 0){
			this.partyInfo = rets.get(0);
			this.Loaded("partyInfo");
			return this.partyInfo;
		}else{
			this.partyInfo = null;
			this.Loaded("partyInfo");
			return this.partyInfo;
		}
	}

}