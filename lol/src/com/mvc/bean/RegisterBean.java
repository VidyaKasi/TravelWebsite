//RegisterBean.java
package com.mvc.bean;

import java.sql.Date;

public class RegisterBean {
 
 private String Cust_First_Name;
 private String Cust_Second_Name;
 private String Cust_DOB;
 private Date Reg_Date;
 private String Cust_ID;
 private String Country_Origin;
 private String Cust_Password;
 private String Cust_Email;
 
 public String getCust_First_Name() {
 return Cust_First_Name;
 }
 
 public void setCust_First_Name(String Cust_First_Name) {
 this.Cust_First_Name = Cust_First_Name;
 }
 
 public String getCust_Second_Name() {
 return Cust_Second_Name;
 }
 
 public void setCust_Second_Name(String Cust_Second_Name) {
 this.Cust_Second_Name = Cust_Second_Name;
 }
 
 public String getCust_DOB() {
 return Cust_DOB;
 }
 
 public void setCust_DOB(String Cust_DOB) {
 this.Cust_DOB = Cust_DOB;
 }
 
 
 public String getCountry_Origin() {
 return Country_Origin;
 }
 
 public void setCountry_Origin(String Country_Origin) {
 this.Country_Origin= Country_Origin;
 }
 
 public String getCust_Password() {
 return Cust_Password;
 }
 
 public void setCust_Password(String Cust_Password) {
 this.Cust_Password= Cust_Password;
 }
 
 public String getCust_Email() {
 return Cust_Email;
 }
 
 public void setCust_Email(String Cust_Email) {
 this.Cust_Email= Cust_Email;
 }

 
 public String getCust_ID() {
 return Cust_ID;
 }
 
 public void setCust_ID(String Cust_ID) {
 this.Cust_ID= Cust_ID;
 }

 public Date getReg_Date() {
 return Reg_Date;
 }
 
 public void setReg_Date(Date Reg_Date) {
 this.Reg_Date= Reg_Date;
 }

}




 
 
 