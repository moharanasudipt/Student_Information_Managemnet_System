package Dao;

import Model.*;
import java.util.List;

public interface Dao {

    //admin 
    public String checkA(String email, String password);

    public String checkS(String email, String password);

    public boolean addStudent(String name, String address, int age, String dob, Long contact, String gender, String gname, String mail, String branch, String password, String photo);

    public String generatePassword(String ename, String email);

    public boolean addResult(String email, String branch, Double CGPA);

    public int updateFees(int CurrentFee, int AmountFee, String email);

    public boolean updateStudent(int id, String name, String address, int age, String guardianName, String email, Long contact);

    public List<Admin> getAdminDetails(String email);

    public List<Student> getAllStudentDetails();

    public boolean deleteStudent(int id);

    //for departments
    public List<Student> getAllDepartment(String branch);

    public List<Student> getStudent(String email);  //For STudent And Update Edit STudent details

    //HR
    public boolean AddAdmin(String name, String email, String password, String photo);

    public boolean deleteAdmin(String email);

    public List<HR> HRDetails();

    //Student 
    public String resetPassword(String email, String password ,String CurrentPassword);
    //student profile edit
    public boolean updateStudentInfo(String email, String name, String address, int age, String gender, String parent, long contact, String dob , String photo);    
}
