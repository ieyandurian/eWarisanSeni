package com.eWarisanSeni.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.eWarisanSeni.app.bean.PersonBean;
import com.eWarisanSeni.app.util.ConnectionManager;

public class PersonDAO {
	public static PersonBean createPerson (PersonBean per) {
		try {
			Connection con = ConnectionManager.getConnection();

			PreparedStatement ps = con
					.prepareStatement("insert into person values(personid.nextVal)");
			ps.executeUpdate();
			per.setValid(true);
		} catch (Exception e2) {
			System.out.println(e2);
		}
		return per;
	}
}
