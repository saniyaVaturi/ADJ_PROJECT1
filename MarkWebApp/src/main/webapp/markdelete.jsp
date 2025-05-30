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
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #121212;
            color: #e0e0e0;
            min-height: 100vh;
            display: flex;
            align-items: stretch;
            margin: 0;
        }
        .sidebar {
            background: #1f1f1f;
            width: 280px;
            padding: 2rem 1.5rem;
            display: flex;
            flex-direction: column;
            border-right: 2px solid #4a90e2;
            box-shadow: 2px 0 12px rgba(74, 144, 226, 0.3);
        }
        .sidebar h2 {
            font-weight: 600;
            font-size: 1.75rem;
            margin-bottom: 2rem;
            color: #4a90e2;
            letter-spacing: 1.2px;
            user-select: none;
        }
        .nav-link {
            color: #bbb;
            font-weight: 500;
            padding: 0.7rem 1rem;
            margin-bottom: 0.4rem;
            border-radius: 8px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .nav-link:hover {
            background: #4a90e2;
            color: #fff;
            text-decoration: none;
        }
        .nav-link.active {
            background: #2f80ed;
            color: #fff;
            box-shadow: 0 0 12px #2f80edaa;
            pointer-events: none;
        }

        .main-content {
            flex-grow: 1;
            padding: 3rem 2rem;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            background: linear-gradient(135deg, #1b1b1b, #222);
        }
        .form-card {
            background: #222;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(74, 144, 226, 0.5);
            padding: 2.5rem 3rem;
            width: 100%;
            max-width: 700px;
        }
        .form-card h3 {
            color: #4a90e2;
            font-weight: 600;
            margin-bottom: 1.8rem;
            user-select: none;
            letter-spacing: 0.05em;
        }
        label.form-label {
            font-weight: 600;
            color: #ccc;
        }
        input.form-control, select.form-select {
            background: #333;
            border: none;
            color: #eee;
            border-radius: 10px;
            padding: 0.6rem 1rem;
            transition: box-shadow 0.3s ease;
        }
        input.form-control:focus, select.form-select:focus {
            outline: none;
            box-shadow: 0 0 8px #4a90e2;
            background: #2a2a2a;
            color: #fff;
        }
        .invalid-feedback {
            color: #f66 !important;
            font-weight: 500;
        }
        .btn-primary {
            background: #4a90e2;
            border: none;
            font-weight: 600;
            padding: 0.7rem 1.2rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px #4a90e2aa;
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: #357abd;
            box-shadow: 0 6px 18px #357abdcc;
        }
        .btn-secondary {
            background: #555;
            border: none;
            color: #ccc;
            font-weight: 600;
            padding: 0.7rem 1.2rem;
            border-radius: 12px;
            margin-left: 10px;
            transition: background 0.3s ease;
        }
        .btn-secondary:hover {
            background: #666;
            color: #fff;
        }
        .alert {
            border-radius: 12px;
            font-weight: 600;
        }
        .alert-success {
            background-color: #2f8f2f;
            color: #d4ffd4;
            box-shadow: 0 0 10px #2f8f2faa;
        }
        .alert-danger {
            background-color: #bf3f3f;
            color: #ffd4d4;
            box-shadow: 0 0 10px #bf3f3faa;
        }
        .btn-close {
            filter: invert(1);
        }
    </style>
</head>
<body>
    <aside class="sidebar">
        <h2>SMMS</h2>
        <nav class="nav flex-column">
            <a class="nav-link" href="index.jsp">Home</a>
            <a class="nav-link active" href="markadd.jsp">Add Marks</a>
            <a class="nav-link" href="markupdate.jsp">Update Marks</a>
            <a class="nav-link" href="markdelete.jsp">Delete Marks</a>
            <a class="nav-link" href="DisplayMarksServlet">Display Marks</a>
            <a class="nav-link" href="report_form.jsp">Generate Reports</a>
        </nav>
    </aside>

    <main class="main-content">
        <div class="form-card">
            <h3>Add New Student Mark</h3>

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

                <div class="d-flex justify-content-start">
                    <button type="submit" class="btn btn-primary">Add Student Mark</button>
                    <button type="reset" class="btn btn-secondary ms-3">Clear Form</button>
                </div>
            </form>
        </div>
    </main>

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
