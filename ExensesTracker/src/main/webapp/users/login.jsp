<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <style>
     	/* Google Fonts Import Link */
			@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
			*{
			  margin: 0;
			  padding: 0;
			  box-sizing: border-box;
			  font-family: 'Poppins', sans-serif;
			}
    	body {
		     background-color: #f4f4f4;
		    margin: 0;
		    padding: 0; /* Remove default padding */
		    height: 100vh; /* Full height for vertical centering */
		    display: flex; /* Use Flexbox for centering */
		    justify-content: center; /* Center horizontally */
		    align-items: center; 
		}
		
		.container {
		    max-width: 420px;
		    margin: auto;
		    background: white;
		    padding: 20px;
		    border-radius: 5px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		    text-align: center;
		}
		
		h2 {
		    margin-bottom: 10px;
		}
		
		label {
		    display: block;
		    margin-bottom: 5px;
		    text-align: left;
		}
		
		input[type="text"],
		input[type="password"] {
		    width: 90%;
		    padding: 10px;
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		}
		
		input[type="submit"] {
		    background: #007BFF;
		    color: white;
		    border: none;
		    padding: 10px;
		    border-radius: 4px;
		    cursor: pointer;
		    width: 100%;
		}
		
		input[type="submit"]:hover {
		    background: #0056b3;
		}
		
		p {
		    margin-top: 15px;
		}
		
		a {
		    color: #007BFF;
		    text-decoration: none;
		}
		
		a:hover {
		    text-decoration: underline;
		}
    	
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="login" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <input type="submit" value="Login">
        </form>
        <p>Don't have an account? <a href="<%=request.getContextPath() %>/registerform">Register here</a></p>
    </div>
</body>
</html>

