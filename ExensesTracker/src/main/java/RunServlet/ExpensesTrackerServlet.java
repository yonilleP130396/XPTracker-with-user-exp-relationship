package RunServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import Dao.*;
import Models.ExpensesTracker;
import Models.User;

@WebServlet("/")
public class ExpensesTrackerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private UserDao userdao;
	 private ExpensesTrackerDao expensestrackerdao;

	    public void init() {
	    	userdao = new UserDao();
	    	expensestrackerdao = new ExpensesTrackerDao();
	    }
  
	
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    	    throws ServletException, IOException {
	    	        String action = request.getServletPath();

	    	        try {
	    	            switch (action) {
	    	                case "/addexpenses":
	    	                    showNewForm(request, response);
	    	                    break;
		    	            case "/login":
	    	                    usersLogin(request, response);
	    	                    break;
	    	                case "/loginpage":
	    	                	loginPage(request, response);
	    	                    break;
	    	                case "/register":
	    	                	insertUser(request, response);
	    	                    break;
	    	                    
	    	                case "/registerform":
	    	                	registerForm(request, response);
	    	                    break;
	    	                    
	    	                case "/list":
	    	                    viewListExpenses(request, response);
	    	                    break;
	    	                case "/insertexpenses":
	    	                	insertExpenses(request, response);
	    	                    break;
	    	                case "/delete":
	    	                    deleteExpenses(request, response);
	    	                    break;
	    	                case "/edit":
	    	                    showEditForm(request, response);
	    	                    break;
	    	                case "/update":
	    	                	updateExpenses(request, response);
	    	                    break;
	    	                case "/logout":
	    	                    usersLogout(request, response);
	    	                    break;
	    	                
	    	                default:
	    	                	defaultroute(request, response);
	    	                    break;
	    	            }
	    	        } catch (SQLException ex) {
	    	            throw new ServletException(ex);
	    	        }
	    	    }

	    	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	        doPost(request, response);
	    	    }
	    	    
	    	    
	    	    
	    	    private void viewListExpenses(HttpServletRequest request, HttpServletResponse response)
	    	    throws SQLException, IOException, ServletException {
	    	    	
	    	    	 HttpSession session = request.getSession(false);
	    	    	    if (session == null || session.getAttribute("user_id") == null) {
	    	    	        response.sendRedirect("loginpage");
	    	    	        return;
	    	    	    }

	    	    	    // Retrieve the user ID from the session
	    	    	    int userId = (int) session.getAttribute("user_id");

	    	    	    // Get expenses based on the user ID
	    	    	    List<ExpensesTracker> listUser = expensestrackerdao.selectAllExpenses(userId);
	    	        request.setAttribute("listUser", listUser);
	    	        RequestDispatcher dispatcher = request.getRequestDispatcher("tracker-expense/list.jsp");
	    	        dispatcher.forward(request, response);
	    	    }


//	    	    private void listStudent(HttpServletRequest request, HttpServletResponse response)
//	    	    throws SQLException, IOException, ServletException {
//	    	        List < Members > listUser = studentDAO.selectAllUsers();
//	    	        request.setAttribute("listUser", listUser);
//	    	        RequestDispatcher dispatcher = request.getRequestDispatcher("student-list.jsp");
//	    	        dispatcher.forward(request, response);
//	    	    }
//
	    	    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
	    	    throws ServletException, IOException {
	    	    	
	    	    	HttpSession session = request.getSession(false); 
	    	        if (session == null || session.getAttribute("username") == null) {
	    	            response.sendRedirect("loginpage");
	    	            return;
	    	        }
	    	    	System.out.println("showing Add Expenses tracker Form");
	    	        RequestDispatcher dispatcher = request.getRequestDispatcher("tracker-expense/expensesform.jsp");
	    	        dispatcher.forward(request, response);
	    	    }
	    	    
	    	    private void insertExpenses(HttpServletRequest request, HttpServletResponse response)
	    	    	    throws SQLException, IOException {
			    	    	HttpSession session = request.getSession(false); 
			    	        if (session == null || session.getAttribute("username") == null) {
			    	            response.sendRedirect("loginpage");
			    	            return;
			    	        }
	    	    	
	    	    	        String title = request.getParameter("title");
	    	    	        String expenses = request.getParameter("expenses");
	    	    	        String category = request.getParameter("category");
	    	    	        String date = request.getParameter("date");
	    	    	        int userid = Integer.parseInt(request.getParameter("userid"));
	    	    	       
	    	    	        ExpensesTracker newUser = new ExpensesTracker(title, expenses,category,date, userid);
	    	    	        expensestrackerdao.insertExpenses(newUser);
	    	    	        response.sendRedirect("list");
	    	    	    }

//
	    	    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
	    	    throws SQLException, ServletException, IOException {
	    	        int id = Integer.parseInt(request.getParameter("id"));
	    	        ExpensesTracker existingUser = expensestrackerdao.selectExpenses(id);
	    	        request.setAttribute("expenses", existingUser);
	    	        RequestDispatcher dispatcher = request.getRequestDispatcher("tracker-expense/expensesform.jsp");
	    	        dispatcher.forward(request, response);

	    	    }
	    	    private void defaultroute(HttpServletRequest request, HttpServletResponse response)
	    	    	    throws SQLException, IOException, ServletException {
	    	    	RequestDispatcher dispatcher = request.getRequestDispatcher("users/index.jsp");
                    dispatcher.forward(request, response);
	    	    	    }
	    	    
	    	    private void loginPage(HttpServletRequest request, HttpServletResponse response)
	    	    	    throws SQLException, IOException, ServletException {
	    	    	RequestDispatcher dispatcher = request.getRequestDispatcher("users/login.jsp");
                    dispatcher.forward(request, response);
	    	    	    }
	    	    
	    	    private void registerForm(HttpServletRequest request, HttpServletResponse response)
	    	    	    throws SQLException, IOException, ServletException {
	    	    	RequestDispatcher dispatcher = request.getRequestDispatcher("users/register.jsp");
                    dispatcher.forward(request, response);
	    	    	    }

	    	    private void insertUser(HttpServletRequest request, HttpServletResponse response)
	    	    throws SQLException, IOException {
	    	        String name = request.getParameter("username");
	    	        String password = request.getParameter("password");
	    	        String role = request.getParameter("role");
	    	       
	    	        User newUser = new User(name, password,role);
	    	        userdao.insertUser(newUser);
	    	        response.sendRedirect("loginpage");
	    	    }
	    	    
	    	    
	    	    
	    	    private void updateExpenses(HttpServletRequest request, HttpServletResponse response)
	    	    throws SQLException, IOException {
	    	        int id = Integer.parseInt(request.getParameter("id"));
	    	        String title = request.getParameter("title");
	    	        String expenses = request.getParameter("expenses");
	    	        String category = request.getParameter("category");
	    	        String date = request.getParameter("date");

	    	        ExpensesTracker book = new ExpensesTracker(id,title, expenses,category,date);
	    	        expensestrackerdao.updateExpenses(book);
	    	        response.sendRedirect("list");
	    	    }

	    	    private void deleteExpenses(HttpServletRequest request, HttpServletResponse response)
	    	    throws SQLException, IOException {
	    	    	 HttpSession session = request.getSession(false);
	    	    	    if (session == null || session.getAttribute("user_id") == null) {
	    	    	        response.sendRedirect("loginpage");
	    	    	        return;
	    	    	    }
	    	    	    
	    	        int id = Integer.parseInt(request.getParameter("id"));
	    	        expensestrackerdao.deleteExpenses(id);
	    	        response.sendRedirect("list");

	    	    }
	    	    
//	    		
	    	    
	    	    protected void usersLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	        HttpSession session = request.getSession(false); // Fetch the session if it exists, don't create a new one
	    	        if (session != null) {
	    	        	System.out.println(session.getAttribute("username")+" has been Logout : "+session);
	    	            session.invalidate(); 
	    	        }
	    	        
	    	        RequestDispatcher dispatcher = request.getRequestDispatcher("start");
	    	        dispatcher.forward(request, response); 
	    	    }
	    	    
	    	    protected void usersLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	       
	    	        String username = request.getParameter("username");
	    	        String password = request.getParameter("password");
	    	        
	    	        User user = userdao.validateUser(username, password);
	    	        
	    	        if (user!=null) { 
	    	            HttpSession session = request.getSession();
	    	            session.setAttribute("user_id", user.getId()); // user ID
	    	            session.setAttribute("username", user.getName()); // username
	    	            session.setAttribute("role", user.getRole()); 
	    	            System.out.println(username+" has been Login : "+session);
	    	            RequestDispatcher dispatcher = request.getRequestDispatcher("tracker-expense/sidebar.jsp");
	    	            dispatcher.forward(request, response); 
	    	        } else {
	    	            response.sendRedirect("loginpage");
	    	        }
	    	    }
	    	    
	    	  

}








   
    
    
   
    
    
