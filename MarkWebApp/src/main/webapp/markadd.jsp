<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student Mark - Mark Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: #f4f6f9;
        }
        .sidebar {
            background: linear-gradient(to bottom, #667eea, #764ba2);
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
        .form-container {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.06);
        }
        .form-label {
            font-weight: 500;
        }
        .btn-primary {
            background-color: #667eea;
            border-color: #667eea;
        }
        .btn-primary:hover {
            background-color: #5a67d8;
            border-color: #5a67d8;
        }
        .btn-secondary {
            background-color: #e2e8f0;
            color: #333;
            border-color: #cbd5e0;
        }
        .btn-secondary:hover {
            background-color: #cbd5e0;
        }
        .alert {
            border-radius: 10px;
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
                <a class="nav-link" href="index.jsp">Home</a>
                <a class="nav-link active" href="markadd.jsp">Add Marks</a>
                <a class="nav-link" href="markupdate.jsp">Update Marks</a>
                <a class="nav-link" href="markdelete.jsp">Delete Marks</a>
                <a class="nav-link" href="DisplayMarksServlet">Display Marks</a>
                <a class="nav-link" href="report_form.jsp">Generate Reports</a>
            </nav>
        </div>

        <!-- Form Content -->
        <div class="col-md-9 p-4">
            <div class="form-container">
                <h3 class="mb-4">Add New Student Mark</h3>

                <% if (request.getAttribute("successMessage") != null) { %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <%= request.getAttribute("successMessage") %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <%= request.getAttribute("errorMessage") %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>

                <form action="AddMarkServlet" method="post" class="needs-validation" novalidate>
                    <div class="mb-3">
                        <label for="studentId" class="form-label">Student ID</label>
                        <input type="text" class="form-control" id="studentId" name="studentId" pattern="\d+" required>
                        <div class="invalid-feedback">Please enter a valid numeric Student ID.</div>
                    </div>

                    <div class="mb-3">
                        <label for="studentName" class="form-label">Student Name</label>
                        <input type="text" class="form-control" id="studentName" name="studentName" required maxlength="100">
                        <div class="invalid-feedback">Please enter a Student Name (max 100 characters).</div>
                    </div>

                    <div class="mb-3">
                        <label for="subject" class="form-label">Subject</label>
                        <select class="form-select" id="subject" name="subject" required>
                            <option value="" selected disabled>Select a subject</option>
                            <option value="Mathematics">Mathematics</option>
                            <option value="Physics">Physics</option>
                            <option value="Chemistry">Chemistry</option>
                            <option value="Biology">Biology</option>
                            <option value="Computer Science">Computer Science</option>
                            <option value="English">English</option>
                            <option value="History">History</option>
                            <option value="Geography">Geography</option>
                        </select>
                        <div class="invalid-feedback">Please select a Subject.</div>
                    </div>

                    <div class="mb-3">
                        <label for="marks" class="form-label">Marks</label>
                        <input type="number" class="form-control" id="marks" name="marks" min="0" max="100" required>
                        <div class="invalid-feedback">Please enter Marks (0-100).</div>
                    </div>

                    <div class="mb-4">
                        <label for="examDate" class="form-label">Exam Date</label>
                        <input type="date" class="form-control" id="examDate" name="examDate" required>
                        <div class="invalid-feedback">Please select a valid Exam Date.</div>
                    </div>

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary">Add Student Mark</button>
                        <button type="reset" class="btn btn-secondary">Clear Form</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Validation Scripts -->
<script>
    (function () {
        'use strict'
        const forms = document.querySelectorAll('.needs-validation');
        Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    })();

    // Custom date validation
    document.getElementById('examDate').addEventListener('change', function () {
        const selectedDate = new Date(this.value);
        const today = new Date();
        this.setCustomValidity(selectedDate > today ? 'Exam date cannot be in the future' : '');
    });

    // Student ID must be numeric
    document.getElementById('studentId').addEventListener('input', function () {
        const value = this.value;
        this.setCustomValidity(/^\d+$/.test(value) || value === '' ? '' : 'Student ID must contain only numbers.');
    });
</script>
</body>
</html>
