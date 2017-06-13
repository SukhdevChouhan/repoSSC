package com.srccodes.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Enumeration;
import java.util.List;
import java.util.Vector;

public class ServiceImpl {
	private static PreparedStatement ps;

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(
					"jdbc:postgresql://localhost:5432/postgres", "postgres", "postgres");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static int save(ServiceBean serviceBean) {
		int status = 0;
		try {
			Connection con = getConnection();
			ps = con.prepareStatement("INSERT INTO public.issue_main(issue_id, issue_name, issue_report_date, issue_update_date, issue_heading, issue_description, issue_status, issue_linked_with, issue_others, issue_closed, issue_type) values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, serviceBean.getIssue_id());
			ps.setString(2, serviceBean.getGetIssue_name());
			ps.setString(3, serviceBean.getIssue_report_date());
			ps.setString(4, serviceBean.getIssue_update_date());
			ps.setString(5, serviceBean.getIssue_heading());
			ps.setString(6, serviceBean.getIssue_description());
			ps.setString(7, serviceBean.getIssue_status());
			ps.setString(8, serviceBean.getIssue_linked_with());
			ps.setString(9, serviceBean.getIssue_others());
			ps.setString(10, serviceBean.getIssue_closed());
			ps.setString(11, serviceBean.getIssue_type());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(ServiceBean serviceBean) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("update public.issue_main set issue_name=?,issue_report_date=?,issue_update_date=?,issue_heading=?,issue_description=?,issue_status=?,issue_linked_with=?,issue_others=?,issue_closed=?,issue_type=? where issue_id=?");
			ps.setString(1, serviceBean.getGetIssue_name());
			ps.setString(2, serviceBean.getIssue_report_date());
			ps.setString(3, serviceBean.getIssue_update_date());
			ps.setString(4, serviceBean.getIssue_heading());
			ps.setString(5, serviceBean.getIssue_description());
			ps.setString(6, serviceBean.getIssue_status());
			ps.setString(7, serviceBean.getIssue_linked_with());
			ps.setString(8, serviceBean.getIssue_others());
			ps.setString(9, serviceBean.getIssue_closed());
			ps.setString(10, serviceBean.getIssue_type());
			ps.setString(11, serviceBean.getIssue_id());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int delete(ServiceBean serviceBean) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("delete from public.issue_main where issue_id=?");
			ps.setString(1, serviceBean.getIssue_id());
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

	public static Enumeration<ServiceBean> getAllRecords() {
		 Vector<ServiceBean> v = new Vector<>();
		Enumeration<ServiceBean> enumu = null;
		ServiceBean serviceBean = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("select * from public.issue_main");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				serviceBean = new ServiceBean();
				serviceBean.setIssue_id(rs.getString(1));
				serviceBean.setGetIssue_name(rs.getString(2));
				serviceBean.setIssue_report_date(rs.getString(3));
				serviceBean.setIssue_update_date(rs.getString(4));
				serviceBean.setIssue_heading(rs.getString(5));
				serviceBean.setIssue_description(rs.getString(6));
				serviceBean.setIssue_status(rs.getString(7));
				serviceBean.setIssue_linked_with(rs.getString(8));
				serviceBean.setIssue_others(rs.getString(9));
				serviceBean.setIssue_closed(rs.getString(10));
				serviceBean.setIssue_type(rs.getString(11));
				v.add(serviceBean);
			}
			enumu = v.elements();
		} catch (Exception e) {
			System.out.println(e);
		}
		return enumu;
	}

	public static ServiceBean getRecordById(String issue_id) {
		ServiceBean serviceBean = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("select * from public.issue_main where issue_id=?");
			ps.setString(1, issue_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				serviceBean = new ServiceBean();
				serviceBean.setIssue_id(rs.getString(1));
				serviceBean.setGetIssue_name(rs.getString(2));
				serviceBean.setIssue_report_date(rs.getString(3));
				serviceBean.setIssue_update_date(rs.getString(4));
				serviceBean.setIssue_heading(rs.getString(5));
				serviceBean.setIssue_description(rs.getString(6));
				serviceBean.setIssue_status(rs.getString(7));
				serviceBean.setIssue_linked_with(rs.getString(8));
				serviceBean.setIssue_others(rs.getString(9));
				serviceBean.setIssue_closed(rs.getString(10));
				serviceBean.setIssue_type(rs.getString(11));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return serviceBean;
	}
}
