<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Mark Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f4f6f9;
            color: #333;
        }
        .sidebar {
            background: linear-gradient(to bottom, #38b2ac, #2f855a);
            color: white;
            min-height: 100vh;
            padding: 30px 20px;
            border-radius: 0 20px 20px 0;
        }
        .sidebar h2 {
            font-size: 1.5rem;
            margin-bottom: 30px;
            font-weight: 700;
        }
        .nav-link {
            color: #f4f6f9;
            font-weight: 500;
        }
        .nav-link.active, .nav-link:hover {
            color: #fff;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 8px;
        }
        .glass-hero {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(15px);
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            text-align: center;
        }
        .glass-hero h1 {
            font-weight: 700;
            color: #4b4f56;
            font-size: 2.8rem;
        }
        .glass-hero p {
            color: #666;
            font-size: 1.1rem;
        }
        .feature-card {
            background: white;
            border: none;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
            transition: transform 0.2s ease;
            text-align: center;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
        .feature-icon {
            font-size: 2rem;
            margin-bottom: 10px;
            color: #38b2ac;
        }
        .btn-custom {
            background-color: #38b2ac;
            color: white;
            border: none;
        }
        .btn-custom:hover {
            background-color: #38b2ac;
        }
        .footer {
            background: #2d3748;
            color: #cbd5e0;
            padding: 40px 0;
            margin-top: 60px;
            text-align: center;
        }
        .footer p {
            margin: 0;
            font-size: 14px;
        }
        .social-icons a {
            margin: 0 10px;
            color: #cbd5e0;
            text-decoration: none;
            font-size: 18px;
        }
        .social-icons a:hover {
            color: white;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 sidebar d-flex flex-column">
            <h2>SMMS</h2>
            <nav class="nav flex-column">
                <a class="nav-link active" href="index.jsp">Home</a>
                <a class="nav-link" href="markadd.jsp">Add Marks</a>
                <a class="nav-link" href="markupdate.jsp">Update Marks</a>
                <a class="nav-link" href="markdelete.jsp">Delete Marks</a>
                <a class="nav-link" href="DisplayMarksServlet">Display Marks</a>
                <a class="nav-link" href="report_form.jsp">Generate Reports</a>
            </nav>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 p-4">
            <div class="glass-hero">
                <h1>Welcome to Student Mark Management System</h1>
         
            </div>

            <!-- Feature Cards: 2 per row on medium+ screens -->
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="feature-card">
                        <div class="feature-icon">🧾</div>
                        <h5>Add Marks</h5>
                    
                        <a href="markadd.jsp" class="btn btn-custom mt-2">Add Marks</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-card">
                        <div class="feature-icon">🛠️</div>
                        <h5>Update Marks</h5>
                     
                        <a href="markupdate.jsp" class="btn btn-custom mt-2">Update</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-card">
                        <div class="feature-icon">❌</div>
                        <h5>Delete Marks</h5>
              
                        <a href="markdelete.jsp" class="btn btn-custom mt-2">Delete</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-card">
                        <div class="feature-icon">📋</div>
                        <h5>Display Marks</h5>
             
                        <a href="DisplayMarksServlet" class="btn btn-custom mt-2">Display</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-card">
                        <div class="feature-icon">📑</div>
                        <h5>Generate Reports</h5>
             
                        <a href="report_form.jsp" class="btn btn-custom mt-2">Reports</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-card">
                        <div class="feature-icon">🧠</div>
                        <h5>About</h5>
                     
                        <button class="btn btn-custom mt-2" data-bs-toggle="modal" data-bs-target="#aboutModal">About</button>
                    </div>
                </div>
            </div>
            <!-- End of Feature Cards -->
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <p>&copy; 2024 Student Mark Management System</p>
    <!--     <div class="social-icons mt-2">
            <a href="https://github.com/sam-ayyy15">GitHub</a>
            <a href="https://x.com/home">𝕏</a>
            <a href="https://www.linkedin.com/in/samayshetty">LinkedIn</a>
            <a href="https://www.instagram.com/sam.ayyy15/?__pwa=1">Instagram</a>
        </div>
        --> 
    </div>
</footer>

<!-- About Modal -->
<div class="modal fade" id="aboutModal" tabindex="-1" aria-labelledby="aboutModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">About Student Mark Management System</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>This system helps manage and track student marks. Built with JSP, Servlets, and JDBC using MVC design.</p>
                <ul>
                    <li>Mark entry and update</li>
                    <li>Delete and search functionality</li>
                    <li>Performance reports and analytics</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
