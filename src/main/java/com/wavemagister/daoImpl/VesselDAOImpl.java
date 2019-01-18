package com.wavemagister.daoImpl;


import com.wavemagister.dao.VesselDAO;
import com.wavemagister.entities.Vessels;
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
public class VesselDAOImpl implements VesselDAO
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
    public void insertVessel(Vessels vessel)
    {
        String sql = "INSERT INTO vessels(name, flag, year_built, dwt, costs, shipowner, active) VALUES(?,?,?,?,?,?,?)";
        //System.out.println("dao called");
        jdbcTemplate.update(sql, new Object[]
        { vessel.getName(),vessel.getFlag(),vessel.getYear_built(),vessel.getDwt(),vessel.getCosts(),vessel.getShipowner(),vessel.getActive()});
    }

    // Getting a particular Employee
    @Override
    public Vessels getVesselById(int id)
    {
        String sql = "SELECT * FROM vessels WHERE id=?";
        Vessels vessel = (Vessels) jdbcTemplate.queryForObject(sql, new Object[]
        { id }, new RowMapper<Vessels>()
        {
            @Override
            public Vessels mapRow(ResultSet rs, int rowNum) throws SQLException 
            {
                Vessels vessel = new Vessels();
                vessel.setName(rs.getString("name"));
                vessel.setFlag(rs.getString("flag"));
                vessel.setYear_built(rs.getString("year_built"));
                vessel.setDwt(rs.getInt("dwt"));
                vessel.setCosts(rs.getInt("costs"));
                vessel.setShipowner(rs.getInt("shipowner"));
                vessel.setActive(rs.getBoolean("active"));
                vessel.setId(rs.getInt("id"));
                return vessel;
            }
        });
        return vessel;
    }
    
    public Vessels getVesselByName(String name)
    {
        String sql = "SELECT * FROM vessels WHERE name=?";
        Vessels vessel = (Vessels) jdbcTemplate.queryForObject(sql, new Object[]
        { name }, new RowMapper<Vessels>()
        {
            @Override
            public Vessels mapRow(ResultSet rs, int rowNum) throws SQLException 
            {
                Vessels vessel = new Vessels();
                vessel.setName(rs.getString("name"));
                vessel.setFlag(rs.getString("flag"));
                vessel.setYear_built(rs.getString("year_built"));
                vessel.setDwt(rs.getInt("dwt"));
                vessel.setCosts(rs.getInt("costs"));
                vessel.setShipowner(rs.getInt("shipowner"));
                vessel.setActive(rs.getBoolean("active"));
                vessel.setId(rs.getInt("id"));
                return vessel;
            }
        });
        return vessel;
    }

    // Getting all the Users
    @Override
    public List<Vessels> getAllVessels()
    {
        String sql = "SELECT * FROM vessels";

        List<Vessels> vesselList = jdbcTemplate.query(sql, new ResultSetExtractor<List<Vessels>>()
        {
            @Override
            public List<Vessels> extractData(ResultSet rs) throws SQLException, DataAccessException
            {
                List<Vessels> list = new ArrayList<Vessels>();
                while (rs.next())
                {
                    Vessels vessel = new Vessels();
                   vessel.setName(rs.getString("name"));
                   vessel.setFlag(rs.getString("flag"));
                   vessel.setYear_built(rs.getString("year_built"));
                   vessel.setDwt(rs.getInt("dwt"));
                   vessel.setCosts(rs.getInt("costs"));
                   vessel.setShipowner(rs.getInt("shipowner"));
                   vessel.setActive(rs.getBoolean("active"));
                   vessel.setId(rs.getInt("id"));
                
                    list.add(vessel);
                }
                return list;
            }
        });
        return vesselList;
    }

    // Updating a particular User
    @Override
    public void updateVessel(Vessels vessel) {
        String sql = "UPDATE vessels SET name = ?, flag = ?, year_built = ?, dwt = ?, costs = ?,shipowner = ?, active=?"
                + " WHERE id = ?";

        jdbcTemplate.update(sql, new Object[]
        { vessel.getName(),vessel.getFlag(),vessel.getYear_built(),vessel.getDwt(),vessel.getCosts(),vessel.getShipowner(),vessel.getActive(),vessel.getId() });
    }

    // Deletion of a particular User
    @Override
    public void deleteVessel(int id)
    {
        String sql = "DELETE FROM vessels WHERE id=?";
        jdbcTemplate.update(sql, new Object[]
        { id });
    }
}
