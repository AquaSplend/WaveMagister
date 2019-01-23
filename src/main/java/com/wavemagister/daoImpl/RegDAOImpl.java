
package com.wavemagister.daoImpl;

import com.wavemagister.entities.User;
import org.springframework.jdbc.core.JdbcTemplate;
import com.wavemagister.dao.RegDAO;

/**
 *
 * @author ΑΛΕΞΑΝΔΡΟΣ
 */
public class RegDAOImpl implements RegDAO{
     private JdbcTemplate jdbcTemplate;
    // JdbcTemplate setter
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
    {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    @Override
    public void register(User user){
        String sql = "INSERT INTO users(username, password, company, role, activated) VALUES(?,?,?,?,?)";
        System.out.println("dao called");
        jdbcTemplate.update(sql, new Object[]
        { user.getUsername(),user.getPassword(),user.getCompany(),user.getRole(),user.isActivated() });
    }
}
