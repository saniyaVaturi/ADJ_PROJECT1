<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Results - Mark Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 30px;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card-header {
            background-color: #3498db;
            color: white;
            font-weight: bold;
            border-radius: 10px 10px 0 0 !important;
        }
        .btn-primary {
            background-color: #3498db;
            border-color: #3498db;
        }
        .btn-primary:hover {
            background-color: #2980b9;
            border-color: #2980b9;
        }
        .alert {
            border-radius: 8px;
        }
        .nav-pills .nav-link.active {
            background-color: #3498db;
        }
        .table {
            margin-bottom: 0;
        }
        .table thead th {
            background-color: #3498db;
            color: white;
            border: none;
        }
        .table tbody tr:hover {
            background-color: #f8f9fa;
        }
        .badge {
            font-size: 0.9em;
        }
        .stats-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .stats-item {
            text-align: center;
        }
        .stats-number {
            font-size: 2rem;
            font-weight: bold;
        }
        .stats-label {
            font-size: 0.9rem;
            opacity: 0.9;
        }
        @media print {
            .no-print {
                display: none !important;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 no-print">
                <div class="card">
                    <div class="card-header">
                        Navigation
                    </div>
                    <div class="card-body">
                        <ul class="nav nav-pills flex-column">
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
                                <a class="nav-link" href="DisplayMarksServlet">Display Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="report_form.jsp">Generate Reports</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-9">
                <!-- Display error messages if any -->
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger alert-dismissible fade show no-print" role="alert">
                        <%= request.getAttribute("errorMessage") %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>
                
                <%
                    String reportTitle = (String) request.getAttribute("reportTitle");
                    List<StudentMark> reportResults = (List<StudentMark>) request.getAttribute("reportResults");
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    
                    if (reportResults != null && !reportResults.isEmpty()) {
                        // Calculate statistics
                        double totalMarks = 0;
                        int maxMarks = Integer.MIN_VALUE;
                        int minMarks = Integer.MAX_VALUE;
                        
                        for (StudentMark mark : reportResults) {
                            totalMarks += mark.getMarks();
                            maxMarks = Math.max(maxMarks, mark.getMarks());
                            minMarks = Math.min(minMarks, mark.getMarks());
                        }
                        
                        double averageMarks = totalMarks / reportResults.size();
                %>
                
                <!-- Report Header -->
                <div class="card">
                    <div class="card-header">
                        <%= reportTitle != null ? reportTitle : "Report Results" %>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h6 class="mb-0">Generated on: <%= new java.util.Date() %></h6>
                            <div class="no-print">
                                <button onclick="window.print()" class="btn btn-outline-primary btn-sm me-2">🖨️ Print Report</button>
                                <a href="report_form.jsp" class="btn btn-secondary btn-sm">🔙 New Report</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Statistics -->
                <div class="stats-card">
                    <div class="row">
                        <div class="col-md-3 stats-item">
                            <div class="stats-number"><%= reportResults.size() %></div>
                            <div class="stats-label">Total Students</div>
                        </div>
                        <div class="col-md-3 stats-item">
                            <div class="stats-number"><%= String.format("%.1f", averageMarks) %></div>
                            <div class="stats-label">Average Marks</div>
                        </div>
                        <div class="col-md-3 stats-item">
                            <div class="stats-number"><%= maxMarks %></div>
                            <div class="stats-label">Highest Marks</div>
                        </div>
                        <div class="col-md-3 stats-item">
                            <div class="stats-number"><%= minMarks %></div>
                            <div class="stats-label">Lowest Marks</div>
                        </div>
                    </div>
                </div>
                
                <!-- Results Table -->
                <div class="card">
                    <div class="card-header">
                        Detailed Results
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Rank</th>
                                        <th>Student ID</th>
                                        <th>Name</th>
                                        <th>Subject</th>
                                        <th>Marks</th>
                                        <th>Grade</th>
                                        <th>Exam Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                    int rank = 1;
                                    for (StudentMark mark : reportResults) { %>
                                    <tr>
                                        <td>
                                            <% if (rank <= 3) { %>
                                                <span class="badge bg-warning">🏆 <%= rank %></span>
                                            <% } else { %>
                                                <%= rank %>
                                            <% } %>
                                        </td>
                                        <td><%= mark.getStudentId() %></td>
                                        <td><%= mark.getStudentName() %></td>
                                        <td><span class="badge bg-primary"><%= mark.getSubject() %></span></td>
                                        <td>
                                            <span class="badge <%= mark.getMarks() >= 80 ? "bg-success" : mark.getMarks() >= 60 ? "bg-warning" : "bg-danger" %>">
                                                <%= mark.getMarks() %>
                                            </span>
                                        </td>
                                        <td>
                                            <span class="badge <%= mark.getMarks() >= 80 ? "bg-success" : mark.getMarks() >= 60 ? "bg-warning" : "bg-danger" %>">
                                                <%= mark.getMarks() >= 80 ? "A" : mark.getMarks() >= 60 ? "B" : "C" %>
                                            </span>
                                        </td>
                                        <td><%= dateFormat.format(mark.getExamDate()) %></td>
                                    </tr>
                                    <% 
                                        rank++;
                                    } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                
                <% } else if (reportResults != null) { %>
                
                <!-- No Results Found -->
                <div class="card">
                    <div class="card-header">
                        <%= reportTitle != null ? reportTitle : "Report Results" %>
                    </div>
                    <div class="card-body text-center">
                        <div class="mb-4">
                            <i style="font-size: 48px; color: #6c757d;">📊</i>
                        </div>
                        <h5 class="text-muted">No Results Found</h5>
                        <p class="text-muted">No student records match the specified criteria.</p>
                        <a href="report_form.jsp" class="btn btn-primary">Generate New Report</a>
                    </div>
                </div>
                
                <% } else { %>
                
                <!-- Default view - no report generated -->
                <div class="card">
                    <div class="card-header">
                        Report Results
                    </div>
                    <div class="card-body text-center">
                        <div class="mb-4">
                            <i style="font-size: 48px; color: #6c757d;">📈</i>
                        </div>
                        <h5 class="text-muted">No Report Generated</h5>
                        <p class="text-muted">Please generate a report first to see the results.</p>
                        <a href="report_form.jsp" class="btn btn-primary">Generate Report</a>
                    </div>
                </div>
                
                <% } %>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>  