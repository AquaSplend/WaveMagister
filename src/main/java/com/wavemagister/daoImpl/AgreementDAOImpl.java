package com.wavemagister.daoImpl;

import com.wavemagister.dao.AgreementDAO;
import com.wavemagister.entities.Agreement;
import com.wavemagister.entities.User;
import com.wavemagister.entities.Vessel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class AgreementDAOImpl implements AgreementDAO {

    private JdbcTemplate jdbcTemplate;

    // JdbcTemplate setter
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // Save a new Agreement
    public void saveAgreement(Agreement agreement) {
        String sql = "INSERT INTO agreements (start, end, vessel_id, user_id, freight) VALUES(?,?,?,?,?);";
        jdbcTemplate.update(sql, new Object[]{agreement.getStart(), agreement.getEnd(), agreement.getVessel().getId(), agreement.getCharterer().getId(), agreement.getFreight()});
    }

    // Getting a particular Agreement
    public Agreement getAgreementById(int id) {
        String sql = "SELECT * FROM agreements WHERE id=?;";
        Agreement agreement = (Agreement) jdbcTemplate.queryForObject(sql, new Object[]{id}, new RowMapper<Agreement>() {
            @Override
            public Agreement mapRow(ResultSet rs, int rowNum) throws SQLException {
                Agreement agreement = new Agreement();
                Vessel vessel = new Vessel();
                User charterer = new User();
                agreement.setId(rs.getInt(1));
                agreement.setStart(rs.getString(2));
                agreement.setEnd(rs.getString(3));
                vessel.setId(rs.getInt(4));
                agreement.setVessel(vessel);
                charterer.setId(rs.getInt(5));
                agreement.setCharterer(charterer);
                agreement.setFreight(rs.getInt(6));
                return agreement;
            }
        });
        return agreement;
    }
    
    // Getting Shipowner's Agreements
    public List<Agreement> getShipownerAgreements(User loggedInUser) {
        String sql = "SELECT `agreements`.`id` AS 'id', \n"
                + "`shipowner`.`company` AS 'Shipowner', \n"
                + "`name` AS 'Vessel', \n"
                + "`charterer`.`company` AS 'Charterer', \n"
                + "`start`, `end`, `freight` \n"
                + "FROM `bteam`.`agreements` \n"
                + "INNER JOIN `bteam`.`vessels` \n"
                + "ON `agreements`.`vessel_id`=`vessels`.`id` \n"
                + "INNER JOIN `users` `shipowner` \n"
                + "ON `vessels`.`shipowner`=`shipowner`.`id` \n"
                + "INNER JOIN `users` `charterer` \n"
                + "ON `agreements`.`user_id`=`charterer`.`id` \n"
                + "WHERE `shipowner`.`id`=" + loggedInUser.getId() + ";";
        
        List<Agreement> agreementList = jdbcTemplate.query(sql, new ResultSetExtractor<List<Agreement>>() {
            @Override
            public List<Agreement> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Agreement> list = new ArrayList<>();
                
                while (rs.next()) {
                    Agreement agreement = new Agreement();
                    Vessel vessel = new Vessel();
                    User shipowner = new User();
                    User charterer = new User();
                    agreement.setId(rs.getInt("id"));
                    agreement.setStart(rs.getString("start"));
                    agreement.setEnd(rs.getString("end"));
                    shipowner.setCompany(rs.getString("Shipowner"));
                    vessel.setShipowner(shipowner);
                    vessel.setName(rs.getString("Vessel"));
                    agreement.setVessel(vessel);
                    charterer.setCompany(rs.getString("Charterer"));
                    agreement.setCharterer(charterer);
                    agreement.setFreight(rs.getInt("freight"));
                    list.add(agreement);
                }
                return list;
            }
        });
        return agreementList;
    }

    // Getting Charterer's Agreements
    public List<Agreement> getChartererAgreements(User loggedInUser) {
        String sql = "SELECT `agreements`.`id` AS 'id', \n"
                + "`shipowner`.`company` AS 'Shipowner', \n"
                + "`name` AS 'Vessel', \n"
                + "`charterer`.`company` AS 'Charterer', \n"
                + "`start`, `end`, `freight`\n"
                + "FROM `bteam`.`agreements`\n"
                + "INNER JOIN `bteam`.`vessels`\n"
                + "ON `agreements`.`vessel_id`=`vessels`.`id`\n"
                + "INNER JOIN `users` `shipowner`\n"
                + "ON `vessels`.`shipowner`=`shipowner`.`id`\n"
                + "INNER JOIN `users` `charterer`\n"
                + "ON `agreements`.`user_id`=`charterer`.`id` \n"
                + "WHERE `shipowner`.`id`='" + loggedInUser.getId() + "';";

        List<Agreement> agreementList = jdbcTemplate.query(sql, new ResultSetExtractor<List<Agreement>>() {
            @Override
            public List<Agreement> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Agreement> list = new ArrayList<>();
                while (rs.next()) {
                    Agreement agreement = new Agreement();
                    Vessel vessel = new Vessel();
                    User shipowner = new User();
                    User charterer = new User();
                    agreement.setId(rs.getInt("id"));
                    agreement.setStart(rs.getString("start"));
                    agreement.setEnd(rs.getString("end"));
                    shipowner.setCompany(rs.getString("Shipowner"));
                    vessel.setShipowner(shipowner);
                    vessel.setName(rs.getString("Vessel"));
                    agreement.setVessel(vessel);
                    charterer.setCompany(rs.getString("Charterer"));
                    agreement.setCharterer(charterer);
                    agreement.setFreight(rs.getInt("freight"));
                    list.add(agreement);
                }
                return list;
            }
        });
        return agreementList;
    }

    // Getting all the Agreements in detail
    public List<Agreement> getAllAgreementsDetails() {
        String sql = "SELECT `agreements`.`id` AS 'id', \n"
                + "`shipowner`.`company` AS 'Shipowner', \n"
                + "`name` AS 'Vessel', \n"
                + "`charterer`.`company` AS 'Charterer', \n"
                + "`start`, `end`, `freight`\n"
                + "FROM `bteam`.`agreements`\n"
                + "INNER JOIN `bteam`.`vessels`\n"
                + "ON `agreements`.`vessel_id`=`vessels`.`id`\n"
                + "INNER JOIN `users` `shipowner`\n"
                + "ON `vessels`.`shipowner`=`shipowner`.`id`\n"
                + "INNER JOIN `users` `charterer`\n"
                + "ON `agreements`.`user_id`=`charterer`.`id`;";

        List<Agreement> agreementList = jdbcTemplate.query(sql, new ResultSetExtractor<List<Agreement>>() {
            @Override
            public List<Agreement> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Agreement> list = new ArrayList<>();
                while (rs.next()) {
                    Agreement agreement = new Agreement();
                    Vessel vessel = new Vessel();
                    User shipowner = new User();
                    User charterer = new User();
                    agreement.setId(rs.getInt("id"));
                    agreement.setStart(rs.getString("start"));
                    agreement.setEnd(rs.getString("end"));
                    shipowner.setCompany(rs.getString("Shipowner"));
                    vessel.setShipowner(shipowner);
                    vessel.setName(rs.getString("Vessel"));
                    agreement.setVessel(vessel);
                    charterer.setCompany(rs.getString("Charterer"));
                    agreement.setCharterer(charterer);
                    agreement.setFreight(rs.getInt("freight"));
                    list.add(agreement);
                }
                return list;
            }

        });
        return agreementList;
    }

    // Getting all the Agreements raw table data
    public List<Agreement> getAllAgreements() {
        String sql = "SELECT * FROM agreements;";

        List<Agreement> agreementList = jdbcTemplate.query(sql, new ResultSetExtractor<List<Agreement>>() {
            @Override
            public List<Agreement> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Agreement> list = new ArrayList<>();
                while (rs.next()) {
                    Agreement agreement = new Agreement();
                    Vessel vessel = new Vessel();
                    User charterer = new User();
                    agreement.setId(rs.getInt(1));
                    agreement.setStart(rs.getString(2));
                    agreement.setEnd(rs.getString(3));
                    vessel.setId(rs.getInt(4));
                    agreement.setVessel(vessel);
                    charterer.setId(rs.getInt(5));
                    agreement.setCharterer(charterer);
                    agreement.setFreight(rs.getInt(6));
                    list.add(agreement);
                }
                return list;
            }

        });
        return agreementList;
    }

    // Updating a particular Agreement
    public void updateAgreement(Agreement agreement) {
        String sql = "UPDATE agreements SET start=?, end=?, vessel_id=?, user_id=?, freight=? where id=?;";
        jdbcTemplate.update(sql, new Object[]{agreement.getStart(), agreement.getEnd(), agreement.getVessel(), agreement.getCharterer(), agreement.getFreight(), agreement.getId()});
    }

    // Deletion of a particular Agreement
    public void deleteAgreement(int id) {
        String sql = "DELETE FROM agreements WHERE id=?;";
        jdbcTemplate.update(sql, new Object[]{id});
    }
}
