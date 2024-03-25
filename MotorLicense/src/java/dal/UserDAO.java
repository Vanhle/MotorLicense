/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.User;

public class UserDAO extends DBContext {

    public User login(String name, String password) {
        try {
            String sql = "SELECT * FROM [user]\n"
                    + "WHERE [userName] = ? AND [password] = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {                
                String userName = rs.getString("userName");
                if(!userName.equals(name)){
                    return null;
                }else {
                    User u = new User();
                    u.setUserId(rs.getInt("userId"));
                    u.setName(rs.getString("name"));
                    u.setUserName(rs.getString("userName"));
                    u.setPassword(rs.getString("password"));
                    u.setRole(rs.getBoolean("role"));
                    return u;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        System.out.println(dao.login("Admin", "1"));
    }
}
