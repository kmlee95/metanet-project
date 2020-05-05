package kr.co.metanet.dto;

import java.sql.Date;

public class OrganizationDTO {

	private String Org_Code;
	private String Org_Name;
	private String Org_Div;
	private String Org_Upper;
	private String Org_Use_YN;
	private Date Org_Effective_Start_Date;
	private Date Org_Effective_End_Date;
	private Date Org_Create_Date;
	private String Org_Create_ID_Code;
	private Date Org_Update_Date;
	private String Org_Update_ID_Code;

	public String getOrg_Code() {
		return Org_Code;
	}

	public void setOrg_Code(String org_Code) {
		Org_Code = org_Code;
	}

	public String getOrg_Name() {
		return Org_Name;
	}

	public void setOrg_Name(String org_Name) {
		Org_Name = org_Name;
	}

	public String getOrg_Div() {
		return Org_Div;
	}

	public void setOrg_Div(String org_Div) {
		Org_Div = org_Div;
	}

	public String getOrg_Upper() {
		return Org_Upper;
	}

	public void setOrg_Upper(String org_Upper) {
		Org_Upper = org_Upper;
	}

	public String getOrg_Use_YN() {
		return Org_Use_YN;
	}

	public void setOrg_Use_YN(String org_Use_YN) {
		Org_Use_YN = org_Use_YN;
	}

	public Date getOrg_Effective_Start_Date() {
		return Org_Effective_Start_Date;
	}

	public void setOrg_Effective_Start_Date(Date org_Effective_Start_Date) {
		Org_Effective_Start_Date = org_Effective_Start_Date;
	}

	public Date getOrg_Effective_End_Date() {
		return Org_Effective_End_Date;
	}

	public void setOrg_Effective_End_Date(Date org_Effective_End_Date) {
		Org_Effective_End_Date = org_Effective_End_Date;
	}

	public Date getOrg_Create_Date() {
		return Org_Create_Date;
	}

	public void setOrg_Create_Date(Date org_Create_Date) {
		Org_Create_Date = org_Create_Date;
	}

	public String getOrg_Create_ID_Code() {
		return Org_Create_ID_Code;
	}

	public void setOrg_Create_ID_Code(String org_Create_ID_Code) {
		Org_Create_ID_Code = org_Create_ID_Code;
	}

	public Date getOrg_Update_Date() {
		return Org_Update_Date;
	}

	public void setOrg_Update_Date(Date org_Update_Date) {
		Org_Update_Date = org_Update_Date;
	}

	public String getOrg_Update_ID_Code() {
		return Org_Update_ID_Code;
	}

	public void setOrg_Update_ID_Code(String org_Update_ID_Code) {
		Org_Update_ID_Code = org_Update_ID_Code;
	}

	@Override
	public String toString() {
		return "OrganizationDTO [Org_Code=" + Org_Code + ", Org_Name=" + Org_Name + ", Org_Div=" + Org_Div
				+ ", Org_Upper=" + Org_Upper + ", Org_Use_YN=" + Org_Use_YN + ", Org_Effective_Start_Date="
				+ Org_Effective_Start_Date + ", Org_Effective_End_Date=" + Org_Effective_End_Date + ", Org_Create_Date="
				+ Org_Create_Date + ", Org_Create_ID_Code=" + Org_Create_ID_Code + ", Org_Update_Date="
				+ Org_Update_Date + ", Org_Update_ID_Code=" + Org_Update_ID_Code + "]";
	}

}