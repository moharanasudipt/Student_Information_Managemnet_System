
package Dao;
import Model.*;
import java.util.List;

public interface Dao {
    //admin 
    public String checkA(String email, String password);
    public String checkS(String email, String password);
    public boolean addStudent(String name, String address, int age, String dob, Long contact, String gender, String gname, String mail, String branch, String password, String photo);
    public String generatePassword(String ename, String email);
    public boolean addResult(String email,String branch,Double CGPA);
    public int updateFees(int CurrentFee,int AmountFee,String email);
    //for departments
    public List<Student> getAllDepartment(String branch);
    public List<Student> getStudent(String email);
    
}