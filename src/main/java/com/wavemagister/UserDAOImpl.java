package com.wavemagister;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO
{

    private JdbcTemplate jdbcTemplate;
    // JdbcTemplate setter
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
    {
        this.jdbcTemplate = jdbcTemplate;
    }

    //String username, String password, String company, String role, boolean activated
    // Saving a new Employee
    @Override
    public void insertUser(User user)
    {
        String sql = "INSERT INTO users(username, password, company, role, activated) VALUES(?,?,?,?,?)";
        System.out.println("dao called");
        jdbcTemplate.update(sql, new Object[]
        { user.getUsername(),user.getPassword(),user.getCompany(),user.getRole(),user.isActivated() });
    }

    // Getting a particular Employee
    @Override
    public User getUserById(int id)
    {
        String sql = "SELECT * FROM users WHERE id=?";
        User user = (User) jdbcTemplate.queryForObject(sql, new Object[]
        { id }, new RowMapper<User>()
        {
            @Override
            public User mapRow(ResultSet rs, int rowNum) throws SQLException 
            {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setCompany(rs.getString("company"));
                user.setRole(rs.getString("role"));
                user.setActivated(rs.getBoolean("activated"));
                user.setId(rs.getInt("id"));
                return user;
            }
        });
        return user;
    }
    
    public User getUserByUsername(String username)
    {
        String sql = "SELECT * FROM users WHERE username=?";
        User user = (User) jdbcTemplate.queryForObject(sql, new Object[]
        { username }, new RowMapper<User>()
        {
            @Override
            public User mapRow(ResultSet rs, int rowNum) throws SQLException 
            {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setCompany(rs.getString("company"));
                user.setRole(rs.getString("role"));
                user.setActivated(rs.getBoolean("activated"));
                user.setId(rs.getInt("id"));
                return user;
            }
        });
        return user;
    }

    // Getting all the Users
    @Override
    public List<User> getAllUsers()
    {
        return getUsers("SELECT * FROM users");  
    }
    
    // Getting users by role
    @Override
    public List<User> getUsersByRole(String role){
        String sql = "SELECT * FROM users WHERE role = '" + role + "'";
        return getUsers(sql);
    }
    
    private List<User> getUsers(String sql){
        List<User> userList = jdbcTemplate.query(sql, new ResultSetExtractor<List<User>>()
        {
            @Override
            public List<User> extractData(ResultSet rs) throws SQLException, DataAccessException
            {
                List<User> list = new ArrayList<User>();
                while (rs.next())
                {
                    User user = new User();
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setCompany(rs.getString("company"));
                    user.setRole(rs.getString("role"));
                    user.setActivated(rs.getBoolean("activated"));
                    user.setId(rs.getInt("id"));
                    list.add(user);
                }
                return list;
            }
        });
        return userList;
    }

    // Updating a particular User
    @Override
    public void updateUser(User user) {
        String sql = "UPDATE users SET username = ?, password = ?, company = ?, role = ?, activated = ? "
                + "WHERE id = ?";

        jdbcTemplate.update(sql, new Object[]
        { user.getUsername(),user.getPassword(),user.getCompany(),user.getRole(),user.isActivated(),user.getId() });
    }

    // Deletion of a particular User
    @Override
    public void deleteUser(int id)
    {
        String sql = "DELETE FROM users WHERE id=?";
        jdbcTemplate.update(sql, new Object[]
        { id });
    }
}
