<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <title>Student Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Google Fonts Import Link */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        /* Dark Mode Styles */
        body {
            background-color: #121212; /* Dark background */
            color: #f5f5f5; /* Light text color for contrast */
        }
        
        .container.is-max-desktop {
            background-color: #1e1e1e; /* Dark background for container */
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
        }
        
        .card-content {
            background-color: #1e1e1e; /* Dark background for card content */
            color: #f5f5f5;
        }

        .input, .button, .select, .textarea {
            background-color: #333333; /* Darker input background */
            color: #f5f5f5; /* Light text for inputs */
            border: 1px solid #555555; /* Border for visibility */
        }

        .input::placeholder, .select, .textarea::placeholder {
            color: #bbbbbb; /* Light grey placeholder text */
        }

        .label {
            color: #cccccc; /* Light grey for labels */
        }

        .button.is-success {
            background-color: #4caf50; /* Custom dark mode button color */
            color: white;
        }

        .button.is-success:hover {
            background-color: #388e3c; /* Darker on hover */
        }
        
         .button-back {
            background-color: #555555; /* Dark background for back button */
            color: #f5f5f5;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        .button-back:hover {
            background-color: #777777; /* Lighter background on hover */
        }
    </style>
</head>

<body>

    <br>
    <div class="container is-max-desktop">
    	<button class="button-back button is-success" onclick="window.history.back()">Back</button>
        <div class="card">
            <div class="card-content">
                <c:if test="${expenses != null}">
                    <form action="update" method="post">
                </c:if>
                <c:if test="${expenses == null}">
                    <form action="insertexpenses" method="post">
                </c:if>

                <div class="content">
                    <h2 class="title is-4 has-text-light">
                        <c:if test="${expenses != null}">
                            Edit Expenses
                        </c:if>
                        <c:if test="${expenses == null}">
                            Add New Expenses
                        </c:if>
                    </h2>
                </div>

                <input class="input" type="hidden" value="<c:out value='<%= session.getAttribute("user_id")%>' />"
                    name="userid" readonly>

                <c:if test="${expenses != null}">
                    <input type="hidden" name="id" value="<c:out value='${expenses.id}' />" />
                </c:if>

                <div class="field">
                    <label class="label">Title</label>
                    <div class="control">
                        <input class="input" type="text" value="<c:out value='${expenses.title}' />" name="title"
                            required="required">
                    </div>
                </div>

                <div class="field">
                    <label class="label">Expenses Amount</label>
                    <div class="control">
                        <input class="input" type="number" value="<c:out value='${expenses.expenses}' />" name="expenses">
                    </div>
                </div>

                <div class="field">
                    <label class="label">Category</label>
                    <div class="control">
                        <input class="input" type="text" value="<c:out value='${expenses.category}' />" name="category">
                    </div>
                </div>

                <div class="field">
                    <label class="label">Date</label>
                    <div class="control">
                        <input class="input" type="date" value="<c:out value='${expenses.date}' />" name="date">
                    </div>
                </div>

                <div class="control">
                    <button type="submit" class="button is-success">Save</button>
                </div>
                </form>
            </div>
        </div>
    </div>

</body>

</html>
