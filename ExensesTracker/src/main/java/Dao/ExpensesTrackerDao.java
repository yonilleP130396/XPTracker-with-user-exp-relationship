package Dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.ExpensesTracker;


public class ExpensesTrackerDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/expenses_tracker";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_EXPENSES_SQL = "INSERT INTO expenses_table (title, expenses,category,date_spent,user_id) VALUES " +
        " (?, ?, ?, ?, ?);";

    
			
    		
    private static final String SELECT_EXPENSES_BY_ID = "select * from expenses_table where id =?";
    private static final String SELECT_EXPENSES_BY_USER = "SELECT * FROM expenses_table WHERE user_id = ?";

    private static final String DELETE_USERS_SQL = "delete from expenses_table where id = ?;";
    private static final String UPDATE_USERS_SQL = "update expenses_table set title=?, expenses=?,category=?,date_spent=? where id = ?;";
    
    
    private static final String SELECT_ACCOUNTUSERS_SQL = "select * from accountloginusers where username = ? and password = ? ";

    public ExpensesTrackerDao() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
    
    
    
//
    public void insertExpenses(ExpensesTracker member) throws SQLException {
        System.out.println(INSERT_EXPENSES_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EXPENSES_SQL)) {
            preparedStatement.setString(1, member.getTitle());
            preparedStatement.setString(2, member.getExpenses());
            preparedStatement.setString(3, member.getCategory());
            preparedStatement.setString(4, member.getDate());
            preparedStatement.setInt(5, member.getUserid());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
//
    public ExpensesTracker selectExpenses(int id) {
    	ExpensesTracker member = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EXPENSES_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String title = rs.getString("title");
                String expenses = rs.getString("expenses");
                String category = rs.getString("category");
                String date = rs.getString("date_spent");
              
                member = new ExpensesTracker(id, title,expenses, category, date);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return member;
    }

    public List < ExpensesTracker > selectAllExpenses(int userId) {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < ExpensesTracker > members = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

        	PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EXPENSES_BY_USER)) {
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
            	int id = rs.getInt("id");
                int userid = rs.getInt("user_id");
                String title = rs.getString("title");
                String expenses = rs.getString("expenses");
                String category = rs.getString("category");
                
                String datespent = rs.getString("date_spent");
                
                members.add(new ExpensesTracker(id, userid, title, expenses, category, datespent));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return members;
    }

    public boolean deleteExpenses(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
        	System.out.println(statement);
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
//    
// 
    public boolean updateExpenses(ExpensesTracker member) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            statement.setString(1, member.getTitle());
            statement.setString(2, member.getExpenses());
            statement.setString(3, member.getCategory());
            statement.setString(4, member.getDate());
            

            statement.setInt(5, member.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    
    
}