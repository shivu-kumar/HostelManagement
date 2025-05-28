package com.dao;

import java.sql.*;
import java.util.*;
import com.model.Student;
import java.sql.Date;



public class HostelDAO {
	private Connection getConnection() throws SQLException {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	    return DriverManager.getConnection("jdbc:mysql://localhost:3307/hosteldb1", "root", "");
	}


    public void addStudent(Student s) throws SQLException {
        String sql = "INSERT INTO HostelStudents1 VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, s.getStudentID());
            ps.setString(2, s.getStudentName());
            ps.setString(3, s.getRoomNumber());
            ps.setDate(4, s.getAdmissionDate());
            ps.setDouble(5, s.getFeesPaid());
            ps.setDouble(6, s.getPendingFees());
            ps.executeUpdate();
        }
    }

    public void updateStudent(Student s) throws SQLException {
        String sql = "UPDATE HostelStudents1 SET StudentName=?, RoomNumber=?, FeesPaid=?, PendingFees=? WHERE StudentID=?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getStudentName());
            ps.setString(2, s.getRoomNumber());
            ps.setDouble(3, s.getFeesPaid());
            ps.setDouble(4, s.getPendingFees());
            ps.setInt(5, s.getStudentID());
            ps.executeUpdate();
        }
    }

    public void deleteStudent(int id) throws SQLException {
        String sql = "DELETE FROM HostelStudents1 WHERE StudentID=?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    public List<Student> getAllStudents() throws SQLException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents1";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getInt(1));
                s.setStudentName(rs.getString(2));
                s.setRoomNumber(rs.getString(3));
                s.setAdmissionDate(rs.getDate(4));
                s.setFeesPaid(rs.getDouble(5));
                s.setPendingFees(rs.getDouble(6));
                list.add(s);
            }
        }
        return list;
    }

    public List<Student> getStudentsByRoom(String room) throws SQLException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents1 WHERE RoomNumber=?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, room);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getInt(1));
                s.setStudentName(rs.getString(2));
                s.setRoomNumber(rs.getString(3));
                s.setAdmissionDate(rs.getDate(4));
                s.setFeesPaid(rs.getDouble(5));
                s.setPendingFees(rs.getDouble(6));
                list.add(s);
            }
        }
        return list;
    }

    public List<Student> getStudentsWithPendingFees() throws SQLException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents1 WHERE PendingFees > 0";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getInt(1));
                s.setStudentName(rs.getString(2));
                s.setRoomNumber(rs.getString(3));
                s.setAdmissionDate(rs.getDate(4));
                s.setFeesPaid(rs.getDouble(5));
                s.setPendingFees(rs.getDouble(6));
                list.add(s);
            }
        }
        return list;
    }

    public List<Student> getStudentsByDateRange(Date from, Date to) throws SQLException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents1 WHERE AdmissionDate BETWEEN ? AND ?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, from);
            ps.setDate(2, to);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getInt(1));
                s.setStudentName(rs.getString(2));
                s.setRoomNumber(rs.getString(3));
                s.setAdmissionDate(rs.getDate(4));
                s.setFeesPaid(rs.getDouble(5));
                s.setPendingFees(rs.getDouble(6));
                list.add(s);
            }
        }
        return list;
    }
    public List<Student> getStudentsByCriteria(String hostelName, String roomNumber) throws SQLException {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents1 WHERE HostelName = ? AND RoomNumber = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, hostelName);
            stmt.setString(2, roomNumber);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Student s = new Student();
                    s.setStudentID(rs.getInt("StudentID"));
                    s.setStudentName(rs.getString("StudentName"));
                    s.setRoomNumber(rs.getString("RoomNumber"));
                    s.setAdmissionDate(rs.getDate("AdmissionDate"));
                    s.setFeesPaid(rs.getDouble("FeesPaid"));
                    s.setPendingFees(rs.getDouble("PendingFees"));
                    students.add(s);
                }
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }

    
}
