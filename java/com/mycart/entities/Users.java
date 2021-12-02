package com.mycart.entities;
import javax.persistence.*;

@Entity
public class Users {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_ID")
	private int userID;
	@Column(name = "user_Name" , length = 100)
	private String userName;
	@Column(name = "user_Email" ,length = 200)
	private String userEmail;
	@Column(name = "user_Password" ,length = 16)
	private String userPassword;
	@Column(name = "user_Phone")
	private int userPhone;
	@Column(name = "user_Pic")
	private String userPic;
	@Column(name = "user_Address" ,length = 3000)
	private String userAddress;
	@Column(name = "user_Type")
	
	
	private String userType;
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Users(int userID, String userName, String userEmail, String userPassword, int userPhone, String userPic,
			String userAddress, String userType) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType = userType;
	}
	
	
	public Users(String userName, String userEmail, String userPassword, int userPhone, String userPic,
			String userAddress, String userType) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType = userType;
	}
	
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	
	public int getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(int userPhone) {
		this.userPhone = userPhone;
	}
	
	
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	
	
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
	
	
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	
	
	
	
	@Override
	public String toString() {
		return "Users [userID=" + userID + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword="
				+ userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress
				+ ", userType=" + userType + "]";
	}
	
	
	

}
