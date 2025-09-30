package com.society.utils;

public class UtilQueries {
	
	public static final String GET_USER_PASS="select username,password from users where username=? and password=?";
	public static final String ADD_OWNER_DETAILS="insert into owners(fname,lname,gender,Flat_No,Contact_No,Building_name,Parking_No,bid) values(?,?,?,?,?,?,?,?)";
	public static final String ADD_FLAT="insert into flats(Buld_name,Flat_Type,parking_Type,Flat_Owner,No_Of_Gallery,Flat_Floor,Flat_Id)  values(?,?,?,?,?,?,?)";
	public static final String ADD_BUILDING="INSERT INTO building (Buld_name,No_Of_Flate,No_Of_Floor) values (?,?,?)";
	public static final String ADD_MAINTENANCE="INSERT INTO maintenance (fno,ownername,monthly_date,fixed_m,service_m,club_house,fine,any_other,total_amount) values (?,?,?,?,?,?,?,?,?)";
	public static final String DISPLAY_DETAILS= "select  distinct maitainence_ID,owner_id,fname,Contact_No,Building_name,Flat_No,total_amount from owners  as o inner join Maintenance as m on o.fname=m.ownername where Flat_No=? and Building_name=? order by monthly_date desc limit 0,1";
	public static final String DISPLAY_PAY_HISTORY="select distinct owner_id,fname,Contact_No,Flat_No,total_amount,monthly_date from  Maintenance,owners where owners.fname=Maintenance.ownername and owners.Flat_No=Maintenance.fno";
	public static final String DISPLAY_OWNER_DETAILs= "select * from owners where Flat_No=?";
	public static final String UPDATE_DETAILS="update owners set fname=?,lname=?,gender=?,Contact_No=?,Parking_No=? where Flat_No=?";
	public static final String DELETE_OWNER="DELETE FROM owners WHERE owner_id=?";
	public static final String FLAT_EXIST="select * from flats where Buld_name=?";
	public static final String OBF_DETAILS="select * from owners where fname=? and Flat_No=?";
	public static final String MAINTENANCE_DETAILS="select * from maintenance where fno=? and ownername=? order by monthly_date desc limit 0,1";
	public static final String BUILDING_DETAILS="select * from building where Buld_name=?";
	public static final String FLAT_DETAILS="select distinct m.fno,max(monthly_date) from owners o ,maintenance m  where o.Flat_No=m.fno group by fno";
	public static final String DISPLAY_PAY_HISTORY1="select distinct owner_id,fname,Contact_No,Flat_No,total_amount,monthly_date from  Maintenance,owners where Flat_No and owners.fname=Maintenance.ownername and owners.Flat_No=Maintenance.fno";
	public static final String DISPLAY_Building_DETAILs="select * from building where Buld_name=?;";
	//public static final String Maintenance="select Flat_No from owners";
	//public static final String DISPLAY_Building_DETAILs="select * from building where Buld_name=?;";
	public static final String Display_Flat="select Flat_No from owners";
	public static final String Display_Building="select Buld_name from building;";
	
}
