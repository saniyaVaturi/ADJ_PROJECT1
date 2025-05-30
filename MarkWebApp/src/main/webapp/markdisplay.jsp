<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Display Student Marks - Mark Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #e0f7fa;
            padding: 2rem 1rem;
            min-height: 100vh;
        }
        .sidebar-card {
            background: #006064;
            color: #e0f2f1;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 96, 100, 0.3);
        }
        .sidebar-card .card-header {
            font-weight: 700;
            font-size: 1.25rem;
            background: transparent;
            border-bottom: none;
            padding: 1.5rem 1.5rem 0.75rem;
        }
        .sidebar-card .nav-link {
            color: #b2dfdb;
            font-weight: 500;
            padding: 0.75rem 1.5rem;
            border-radius: 10px;
            transition: background 0.3s, color 0.3s;
            margin-bottom: 0.25rem;
        }
        .sidebar-card .nav-link:hover,
        .sidebar-card .nav-link.active {
            background: #004d40;
            color: #a7ffeb;
        }
        .main-card {
            background: #ffffffdd;
            border-radius: 20px;
            box-shadow: 0 12px 24px rgba(0,0,0,0.12);
            padding: 2rem;
            min-height: 80vh;
        }
        .main-card .card-header {
            background: #004d40;
            color: #a7ffeb;
            font-weight: 700;
            font-size: 1.5rem;
            border-radius: 20px 20px 0 0 !important;
            padding: 1rem 2rem;
            box-shadow: 0 4px 10px rgba(0,77,64,0.3);
        }
        .btn-primary {
            background: #00796b;
            border: none;
            font-weight: 600;
            transition: background 0.3s;
        }
        .btn-primary:hover {
            background: #004d40;
        }
        .btn-success {
            background: #009688;
            border: none;
        }
        .btn-success:hover {
            background: #00796b;
        }
        .btn-outline-secondary {
            color: #00796b;
            border-color: #00796b;
        }
        .btn-outline-secondary:hover {
            background: #004d40;
            color: #a7ffeb;
            border-color: #004d40;
        }
        .badge {
            font-weight: 600;
            font-size: 0.85rem;
            padding: 0.4em 0.75em;
            border-radius: 12px;
        }
        .badge-success {
            background-color: #26a69a;
            color: white;
        }
        .badge-warning {
            background-color: #ffb300;
            color: white;
        }
        .badge-danger {
            background-color: #d32f2f;
            color: white;
        }
        table.table thead th {
            background: #004d40;
            color: #a7ffeb;
            border: none;
            letter-spacing: 0.05em;
        }
        table.table tbody tr:hover {
            background: #b2dfdb;
            transition: background 0.3s;
        }
        .alert {
            border-radius: 15px;
            font-weight: 600;
        }
        .icon-placeholder {
            font-size: 4rem;
            color: #00796b;
            opacity: 0.3;
        }
        /* Responsive */
        @media (max-width: 991px) {
            .sidebar-card {
                margin-bottom: 1.5rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row g-4">
        <!-- Sidebar -->
        <div class="col-lg-3">
            <div class="card sidebar-card">
                <div class="card-header">Navigation</div>
                <div class="card-body px-0">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="markadd.jsp">Add Marks</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="markupdate.jsp">Update Marks</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="markdelete.jsp">Delete Marks</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="DisplayMarksServlet">Display Marks</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="report_form.jsp">Generate Reports</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-lg-9">
            <div class="card main-card">
                <div class="card-header">Display Student Marks</div>
                <div class="card-body">

                    <% if (request.getAttribute("errorMessage") != null) { %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <%= request.getAttribute("errorMessage") %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <!-- Search Form -->
                    <div class="mb-4 p-3 rounded" style="background: #e0f2f1;">
                        <form action="DisplayMarksServlet" method="get" class="d-flex flex-wrap gap-2 align-items-center">
                            <input
                                type="number"
                                class="form-control flex-grow-1"
                                name="studentId"
                                placeholder="Enter Student ID"
                                aria-label="Search Student ID"
                                min="0"
                            />
                            <button type="submit" class="btn btn-success px-4">Search</button>
                            <a href="DisplayMarksServlet" class="btn btn-outline-secondary px-4">Show All</a>
                        </form>
                    </div>

                    <%
                        StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
                        List<StudentMark> marksList = (List<StudentMark>) request.getAttribute("marksList");
                        Boolean searchPerformed = (Boolean) request.getAttribute("searchPerformed");
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

                        if (studentMark != null) {
                    %>

                    <!-- Single Student Result -->
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-teal text-white" style="background-color:#00796b !important; border-radius: 15px 15px 0 0;">
                            Search Result
                        </div>
                        <div class="card-body">
                            <div class="row gy-3">
                                <div class="col-md-6">
                                    <p><strong>Student ID:</strong> <%= studentMark.getStudentId() %></p>
                                    <p><strong>Student Name:</strong> <%= studentMark.getStudentName() %></p>
                                    <p><strong>Subject:</strong> <span class="badge badge-primary bg-info text-white"><%= studentMark.getSubject() %></span></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Marks:</strong>
                                        <span class="badge
                                            <%= studentMark.getMarks() >= 80 ? "badge-success" : studentMark.getMarks() >= 60 ? "badge-warning" : "badge-danger" %>">
                                            <%= studentMark.getMarks() %>
                                        </span>
                                    </p>
                                    <p><strong>Exam Date:</strong> <%= dateFormat.format(studentMark.getExamDate()) %></p>
                                    <p><strong>Grade:</strong>
                                        <span class="badge
                                            <%= studentMark.getMarks() >= 80 ? "badge-success" : studentMark.getMarks() >= 60 ? "badge-warning" : "badge-danger" %>">
                                            <%= studentMark.getMarks() >= 80 ? "A" : studentMark.getMarks() >= 60 ? "B" : "C" %>
                                        </span>
                                    </p>
                                </div>
                            </div>
                            <div class="mt-4">
                                <a href="UpdateMarkServlet?studentId=<%= studentMark.getStudentId() %>" class="btn btn-warning me-2">Edit</a>
                                <a href="DeleteMarkServlet?studentId=<%= studentMark.getStudentId() %>" class="btn btn-danger">Delete</a>
                            </div>
                        </div>
                    </div>

                    <% } else if (marksList != null && !marksList.isEmpty()) { %>

                    <!-- All Students Table -->
                    <div class="table-responsive rounded shadow-sm">
                        <table class="table table-hover mb-0">
                            <thead>
                                <tr>
                                    <th>Student ID</th>
                                    <th>Name</th>
                                    <th>Subject</th>
                                    <th>Marks</th>
                                    <th>Grade</th>
                                    <th>Exam Date</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (StudentMark mark : marksList) { %>
                                <tr>
                                    <td><%= mark.getStudentId() %></td>
                                    <td><%= mark.getStudentName() %></td>
                                    <td><span class="badge badge-primary bg-info text-white"><%= mark.getSubject() %></span></td>
                                    <td>
                                        <span class="badge
                                        <%= mark.getMarks() >= 80 ? "badge-success" : mark.getMarks() >= 60 ? "badge-warning" : "badge-danger" %>">
                                            <%= mark.getMarks() %>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge
                                        <%= mark.getMarks() >= 80 ? "badge-success" : mark.getMarks() >= 60 ? "badge-warning" : "badge-danger" %>">
                                            <%= mark.getMarks() >= 80 ? "A" : mark.getMarks() >= 60 ? "B" : "C" %>
                                        </span>
                                    </td>
                                    <td><%= dateFormat.format(mark.getExamDate()) %></td>
                                    <td>
                                        <a href="UpdateMarkServlet?studentId=<%= mark.getStudentId() %>" class="btn btn-warning btn-sm me-1 mb-1">Edit</a>
                                        <a href="DeleteMarkServlet?studentId=<%= mark.getStudentId() %>" class="btn btn-danger btn-sm mb-1">Delete</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>

                    <% } else if (searchPerformed != null && searchPerformed) { %>
                        <div class="alert alert-warning text-center">
                            No records found for the searched Student ID.
                        </div>
                    <% } else { %>
                        <div class="text-center mt-5">
                            <i class="icon-placeholder bi bi-file-earmark-text"></i>
                            <p class="text-muted fs-5 mt-3">No marks data to display. Use the search or add marks.</p>
                        </div>
                    <% } %>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
</body>
</html>
