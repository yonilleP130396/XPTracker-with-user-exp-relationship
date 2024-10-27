<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <title>Gratefulness Management System</title>
    
    <!-- CSS Libraries -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/1.0.1/css/bulma.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bulma.css">

    <!-- Custom Style -->
    <style>
        /* Google Fonts Import Link */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>

<body>
    <br>
    <div class="container">
        <div class="columns is-vcentered">
            <div class="column is-four-fifths">
                <h1 class="title is-4">List of Expenses</h1>
            </div>
        </div>
        <hr>
        <div class="container text-left">
            <a href="<%=request.getContextPath()%>/addexpenses" class="button is-success">Add New Expenses</a>
        </div>
        <br>
        <table class="table is-striped is-bordered" id="dataTable">
            <thead>
                <tr>
                   
                    <th>Title</th>
                    <th>Expenses Amount</th>
                    <th>Category</th>
                    <th>Date</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="expenses" items="${listUser}">
                    <tr>
                        
                        <td><c:out value="${expenses.title}" /></td>
                        <td><c:out value="${expenses.expenses}" /></td>
                        <td><c:out value="${expenses.category}" /></td>
                        <td><c:out value="${expenses.date}" /></td>
                        <td>
                            <form action="<%=request.getContextPath()%>/edit" method="post">
                                <input type="hidden" name="id" value="${expenses.id}">
                                <button type="submit" class="button is-primary">Edit</button>
                            </form>
                        </td>
                        <td>
                            <form action="<%=request.getContextPath()%>/delete" method="post">
                                <input type="hidden" name="id" value="${expenses.id}">
                                <button type="submit" class="button is-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- jQuery and DataTables Scripts -->
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.1.8/js/dataTables.bulma.js"></script>
    
    <script>
        // Initialize DataTables with custom settings
        $(document).ready(function () {
            $('#dataTable').DataTable({
                "paging": true,            // Enable pagination
                "searching": true,         // Enable the search bar
                "ordering": true,          // Enable column ordering
                "info": true,              // Show table information
                "autoWidth": true,        // Prevent automatic width adjustments
                "pageLength": 15,           // Set initial number of rows per page
                "lengthMenu": [15, 30, 45, 100], // Options for number of rows per page
                "language": {
                    "search": "Filter records:",  // Customize the search bar label
                    "paginate": {
                        "first": "First",
                        "last": "Last",
                        "next": "Next",
                        "previous": "Prev"
                    }
                }
            });
        });
    </script>
</body>

</html>
