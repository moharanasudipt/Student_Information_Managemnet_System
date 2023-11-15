package Dao;

import java.util.*;
import Model.*;
import Model.Student;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.*;
import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;

public class DaoImpl implements Dao {

    Connection con = null;

    // Creating Connetion Pooling
    public Connection openConnection() {
        Connection connection = null;
        try {
            BasicDataSource bd = new BasicDataSource();
            bd.setUsername("root");
            bd.setPassword("SKgudu@2003");
            bd.setUrl("jdbc:mysql://localhost:3306/cutm");
            bd.setDriverClassName("com.mysql.jdbc.Driver");
            DataSource ds = (DataSource) bd;
            connection = ds.getConnection();

            System.out.println("Connection Created ");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    //Close Connection
    private void closeConnection(Connection connection) {

        try {
            if (connection != null) {
                System.out.println("Connection Close Successfully");
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // for cheking the admin role
    @Override
    public String checkA(String email, String password) {
        Connection con = null;
        String role = null;
        try {
            con = openConnection();
            
            if (con != null) {
                System.out.println("check method Admin");
                String qs = "select Role from admin WHERE EMAIL=? AND PASSWORD=?";
                PreparedStatement ps = con.prepareStatement(qs);
                ps.setString(1, email);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                
                if (rs != null) {
                    System.out.println("admin if");
                    while (rs.next()) {
                        role = rs.getString(1);
                        System.out.println("ADROLE " + role);

                    }
                }

            }

        } catch (Exception e) {

        }
        return role;
    }

    //for check the student role
    @Override
    public String checkS(String email, String password) {
        Connection con = null;
        String role = null;
        try {
            con = openConnection();
            
            if (con != null) {
                System.out.println("check method Student");
                String qs = "select role from student WHERE EMAIL=? AND PASSWORD=?";
                PreparedStatement ps = con.prepareStatement(qs);
                ps.setString(1, email);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                
                if (rs != null) {
                    System.out.println("Student if");
                    while (rs.next()) {
                        role = rs.getString(1);
                        System.out.println("SDROLE " + role);

                    }
                }

            }

        } catch (Exception e) {

        }
        return role;
    }

    //for registering student
    @Override
    public boolean addStudent(String name, String address, int age, String dob, Long contact, String gender, String gname, String mail, String branch, String password, String photo) {
        boolean flag = false;
        try {
            Connection con = openConnection();
            System.out.println("storeEmp:" + con);
            if (con != null) {
                System.out.println("store student");
                String qs = "insert into Student(name,address,age,dob,contact,gender,guardianname,email,password,photo,branch) values(?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(qs);

                ps.setString(1, name);
                ps.setString(2, address);
                ps.setInt(3, age);
                ps.setString(4, dob);
                ps.setLong(5, contact);
                ps.setString(6, gender);
                ps.setString(7, gname);
                ps.setString(8, mail);
                ps.setString(9, password);
                ps.setString(10, photo);
                ps.setString(11, branch);

                int result = ps.executeUpdate();

                if (result == 1) {
                    flag = true;
                    
                }

            }

        } catch (Exception e) {
            e.printStackTrace(); // e.getMessage()
        } finally {
            closeConnection(con);
        }
        return flag;

    }

    //for auto-generate password
    @Override
    public String generatePassword(String ename, String email) {
        String inputForPassword = ename + email;
        int passwordLength = 8;
        StringBuilder password = new StringBuilder();
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(inputForPassword.getBytes());

            for (byte b : hash) {
                int value = (b & 0xFF) % 36; // Convert the byte to a value between 0 and 35
                char charToAdd = (value < 10) ? (char) ('0' + value) : (char) ('a' + (value - 10));

                if (password.length() < passwordLength) {
                    password.append(charToAdd);
                }
                if (password.length() >= passwordLength) {
                    break;
                }
            }

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return password.toString();
    }

    // For update the result
    @Override
    public boolean addResult(String email, String branch, Double CGPA) {

        boolean flag = false;
        try {

            Connection con = openConnection();
            
            if (con != null) {
                System.out.println("Result added");
                String qs = "update student set cgpa=? where email = ? and branch = ?";
                PreparedStatement ps = con.prepareStatement(qs);

                ps.setDouble(1, CGPA);
                ps.setString(2, email);
                ps.setString(3, branch);

                int result = ps.executeUpdate();
                if (result == 1) {
                    flag = true;
                    
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con);
        }
        return flag;
    }

    //department wise fetch students
    @Override
    public List<Student> getAllDepartment(String branch) {
        Connection con = null;
        List<Student> list = new ArrayList<Student>();
        try {
            con = openConnection();
            
            if (con != null) {
                System.out.println("branch show ");
                String s = "select id,name,address,age,GuardianName,email,cgpa,contact from student where branch=?";
                PreparedStatement ps = con.prepareStatement(s);
                ps.setString(1, branch);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Student e = new Student();
                    e.setId(rs.getInt(1));
                    e.setName(rs.getString(2));
                    e.setAddress(rs.getString(3));
                    e.setAge(rs.getInt(4));
                    e.setGuardianName(rs.getString(5));
                    e.setEmail(rs.getString(6));
                    e.setCgpa(rs.getDouble(7));
                    e.setContact(rs.getLong(8));

                    list.add(e);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(con);
        }
        return list;
    }

    //In Update page and retrive data in student page also 
    @Override
    public List<Student> getStudent(String email) {
        Connection con = null;
        List<Student> list = new ArrayList<Student>();
        try {
            con = openConnection();
            String qs = "select id,name,address,age,dob,contact,gender,GuardianName,email,password,photo,branch,CGPA,fees from Student where email=?";
            PreparedStatement ps = con.prepareStatement(qs);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt(1));
                s.setName(rs.getString(2));
                s.setAddress(rs.getString(3));
                s.setAge(rs.getInt(4));
                s.setDob(rs.getString(5));
                s.setContact(rs.getLong(6));
                s.setGender(rs.getString(7));
                s.setGuardianName(rs.getString(8));
                s.setEmail(rs.getString(9));
                s.setPassword(rs.getString(10));
                s.setPhoto(rs.getString(11));
                s.setBranch(rs.getString(12));
                s.setCgpa(rs.getDouble(13));
                s.setFees(rs.getInt(14));
                list.add(s);
            }
        } catch (SQLException f) {
            System.out.println(f.getMessage());
        } finally {
            closeConnection(con);
        }
        return list;
    }

    //for update fees
    @Override
    public int updateFees(int CurrentFee,int AmountFee ,String email) {
        Connection con = null;
        int Ufee= 0;
        try {
            con = openConnection();
            String Proc = "{call Fees(?,?,?)}";
            CallableStatement cs = con.prepareCall(Proc);
            cs.registerOutParameter(3, Types.NUMERIC);
            cs.setInt(1, CurrentFee);
            cs.setInt(2, AmountFee);
            cs.execute();
            Ufee=cs.getInt(3);
            System.out.println("Updated fee"+Ufee);
            String ps= "update student set fees=? where email=?";
            
            PreparedStatement pst= con.prepareStatement(ps);
            pst.setInt(1, Ufee);
            pst.setString(2, email);
            int result=pst.executeUpdate();
            System.out.println("Updated Result :"+result);
            
        } catch (Exception e) {
        }
        return Ufee;
    }
    
    //for edit student
    @Override
    public boolean updateStudent(int id,String name,String address,int age,String guardianName,String email,Long contact){
        Connection con = null;
        boolean flg=false;        
        try {
            con = openConnection();
            String qs = "update student set name=?,address=?,age=?,GuardianName=?,email=?,contact=? where id=?";
            PreparedStatement ps = con.prepareStatement(qs);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setInt(3, age);
            ps.setString(4, guardianName);
            ps.setString(5, email);
            ps.setLong(6, contact);
            ps.setInt(7, id);
            
            int rs = ps.executeUpdate();
            if(rs!=0) {
                   flg=true;            
            }
        } catch (SQLException f) {
            System.out.println(f.getMessage());
        } finally {
            closeConnection(con);
        }
        return flg;
    }
    
    //for get all admin details
    @Override
    public List<Admin> getAdminDetails(String email){
       Connection con = null;
        List<Admin> list = new ArrayList<Admin>();
        try {
            con = openConnection();
            String qs = "select id,name,email,photo from Admin where email=?";
            PreparedStatement ps = con.prepareStatement(qs);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Admin s = new Admin();
                s.setId(rs.getInt(1));
                s.setName(rs.getString(2));                
                s.setEmail(rs.getString(3));
                s.setPhoto(rs.getString(4));                
                list.add(s);
            }
        } catch (SQLException f) {
            System.out.println(f.getMessage());
        } finally {
            closeConnection(con);
        }
        return list;
    }
    
    //for student details
    @Override
    public List<Student> getAllStudentDetails(){
        Connection con = null;
        List<Student> list = new ArrayList<Student>();
        try {
            con = openConnection();
            String qs = "select id,name,address,age,GuardianName,email,branch,contact from Student";
            PreparedStatement ps = con.prepareStatement(qs);            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt(1));
                s.setName(rs.getString(2));                
                s.setAddress(rs.getString(3));     
                s.setAge(rs.getInt(4));
                s.setGuardianName(rs.getString(5));     
                s.setEmail(rs.getString(6));
                s.setBranch(rs.getString(7));
                s.setContact(rs.getLong(8));                            
                list.add(s);
            }
        } catch (SQLException f) {
            System.out.println(f.getMessage());
        } finally {
            closeConnection(con);
        }
        return list;
    } 
    
    //for delete student
    @Override
    public boolean deleteStudent(int id) {
        Connection con = null;  
        boolean flag=false;
        try {
            con = openConnection();            
            String qs = "delete from student where id = ?";
            PreparedStatement ps = con.prepareStatement(qs);
            ps.setInt(1, id);
            int res = ps.executeUpdate();
            if (res == 1) { 
                flag=true;
                System.out.println("Record deleted successfully:");
            }
        } catch (Exception e) {
        } finally {
            closeConnection(con);
        }
        return flag;
    }        

    //Student reset password
    @Override
    public String resetPassword(String email, String CurrentPassword,String NewPassword) {
       Connection con = null;       
        String pwd=null;              
        try {
            con = openConnection();
            
            String qs1="select name from student where email=? and password=?";
            PreparedStatement  ps = con.prepareStatement(qs1);                        
            ps.setString(1, email);           
            ps.setString(2, CurrentPassword);  
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
               pwd = rs.getString(1);
            } 
            
            if(pwd!=null){
            String qs = "update student set password=? where email=?";
            PreparedStatement  ps1 = con.prepareStatement(qs);
            ps1.setString(1, NewPassword);           
            ps1.setString(2, email);                        
            int rs1 = ps1.executeUpdate();
                if(rs1!=0){
                     pwd="Password reset";
                }
                 else{
                     pwd=null;
                }
            } else{
                pwd=null;
            }
            
        } catch (SQLException f) {
            System.out.println(f.getMessage());
        } finally {
            closeConnection(con);
        }
        return pwd;
    }        
    
    //For Adding Admin
    @Override
    public boolean AddAdmin(String name, String email, String password,String photo) {
        boolean flag = false;
        try {
            Connection con = openConnection();
            
            if (con != null) {
                System.out.println("admin added");
                String qs = "insert into Admin(name,email,password,photo) values(?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(qs);

                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, password);
                ps.setString(4, photo);
                
                int result = ps.executeUpdate();
                if (result == 1) {
                    flag = true;
                    
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection(con);
        }
        return flag;
    }
    
    //For delete admin
    @Override
    public boolean deleteAdmin(String email){
        Connection con = null;  
        boolean flag=false;
        try {
            con = openConnection();            
            String qs = "delete from Admin where email = ?";
            PreparedStatement ps = con.prepareStatement(qs);
            ps.setString(1, email);
            int res = ps.executeUpdate();
            if (res == 1) { 
                flag=true;
                System.out.println("Admin deleted successfully:");
            }
        } catch (Exception e) {
        } finally {
            closeConnection(con);
        }
        return flag;
    }
    
    //For HR details
    @Override
    public List<HR> HRDetails(){
        Connection con = null;
        List<HR> list = new ArrayList<HR>();
        try {
            con = openConnection();
            String qs = "select name,photo from HR";
            PreparedStatement ps = con.prepareStatement(qs);            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HR hr = new HR();                
                hr.setName(rs.getString(1));                                
                hr.setPhoto(rs.getString(2));                
                list.add(hr);
            }
        } catch (SQLException f) {
            System.out.println(f.getMessage());
        } finally {
            closeConnection(con);
        }
        return list;
    }
            
    //For Edit Student details
    @Override
    public boolean updateStudentInfo(String email, String name, String address, int age, String gender, String parent, long contact, String dob , String photo){
        Connection con = null;
        boolean st=false;        
        try {
            con = openConnection();
            String qs = "update student set name=?,address=?,age=?,gender=?,GuardianName=?,contact=?,dob=?,photo=?  where email=?";
            PreparedStatement ps = con.prepareStatement(qs);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setInt(3, age);
            ps.setString(4, gender);
            ps.setString(5, parent);
            ps.setLong(6, contact);
            ps.setString(7, dob);
            ps.setString(8, photo);
            ps.setString(9, email);
            
            int rs = ps.executeUpdate();
            if(rs!=0) {
                   st=true;            
            }
        } catch (SQLException f) {
            System.out.println(f.getMessage());
        } finally {
            closeConnection(con);
        }
        return st;
    }
}