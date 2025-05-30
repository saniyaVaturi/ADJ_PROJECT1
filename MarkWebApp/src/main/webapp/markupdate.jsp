<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Update Student Mark - Mark Management System</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet" />
<style>
  body {
    font-family: 'Montserrat', sans-serif;
    background: linear-gradient(135deg, #c3cfe2, #e0eafc);
    min-height: 100vh;
    padding: 40px 20px;
  }
  .sidebar {
    background: #a29bfe;
    border-radius: 15px;
    padding: 20px;
    color: #fff;
    box-shadow: 0 8px 20px rgba(162,155,254,0.4);
  }
  .sidebar .nav-link {
    color: #dfe6e9;
    font-weight: 600;
    padding: 12px 15px;
    border-radius: 10px;
    margin-bottom: 8px;
    transition: background-color 0.3s ease;
  }
  .sidebar .nav-link:hover {
    background: #6c5ce7;
    color: #fff;
  }
  .sidebar .nav-link.active {
    background: #6c5ce7;
    color: #fff;
    box-shadow: 0 0 10px #6c5ce7;
  }
  .card-custom {
    background: #fff;
    border-radius: 20px;
    padding: 30px;
    box-shadow: 0 15px 30px rgba(108,92,231,0.2);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }
  .card-custom:hover {
    transform: translateY(-8px);
    box-shadow: 0 25px 40px rgba(108,92,231,0.3);
  }
  .card-header-custom {
    font-weight: 700;
    font-size: 1.5rem;
    color: #6c5ce7;
    border-bottom: 2px solid #dfe6e9;
    margin-bottom: 25px;
    text-align: center;
  }
  label {
    font-weight: 600;
    color: #636e72;
  }
  input.form-control, select.form-select {
    border-radius: 12px;
    padding: 12px 15px;
    border: 2px solid #dfe6e9;
    transition: border-color 0.3s ease;
  }
  input.form-control:focus, select.form-select:focus {
    border-color: #6c5ce7;
    box-shadow: 0 0 8px rgba(108,92,231,0.3);
  }
  .btn-primary {
    background-color: #6c5ce7;
    border: none;
    font-weight: 600;
    border-radius: 12px;
    padding: 12px;
    transition: background-color 0.3s ease;
  }
  .btn-primary:hover {
    background-color: #341f97;
  }
  .btn-secondary {
    border-radius: 12px;
    padding: 12px;
  }
  .alert {
    border-radius: 15px;
    font-weight: 600;
  }
  /* Responsive adjustments */
  @media (max-width: 991px) {
    body {
      padding: 20px 10px;
    }
    .sidebar {
      margin-bottom: 25px;
    }
  }
</style>
</head>
<body>
<div class="container">
  <div class="row gx-5">
    <!-- Sidebar Navigation -->
    <nav class="col-lg-3 sidebar">
      <h4 class="mb-4 text-center">Menu</h4>
      <ul class="nav flex-column">
        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="markadd.jsp">Add Marks</a></li>
        <li class="nav-item"><a class="nav-link active" href="markupdate.jsp">Update Marks</a></li>
        <li class="nav-item"><a class="nav-link" href="markdelete.jsp">Delete Marks</a></li>
        <li class="nav-item"><a class="nav-link" href="DisplayMarksServlet">Display Marks</a></li>
        <li class="nav-item"><a class="nav-link" href="report_form.jsp">Generate Reports</a></li>
      </ul>
    </nav>

    <!-- Main Content -->
    <main class="col-lg-9">
      <div class="card-custom">
        <div class="card-header-custom">
          Update Student Mark
        </div>

        <!-- Success/Error Alerts -->
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

        <!-- Search Form -->
        <div class="mb-5 p-4 bg-light rounded-4 shadow-sm">
          <h5 class="mb-3 text-center text-muted fw-semibold">Search Student by ID</h5>
          <form action="UpdateMarkServlet" method="get" class="d-flex gap-3 justify-content-center">
            <input
              type="number"
              class="form-control form-control-lg"
              name="studentId"
              placeholder="Enter Student ID"
              required
              style="max-width: 300px;"
            />
            <button type="submit" class="btn btn-primary btn-lg px-4">Search</button>
          </form>
        </div>

        <!-- Update Form -->
        <%
          StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
          SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        %>
        <form
          action="UpdateMarkServlet"
          method="post"
          id="updateMarkForm"
          class="needs-validation"
          novalidate
        >
          <div class="mb-4">
            <label for="studentId" class="form-label">Student ID</label>
            <input
              type="number"
              class="form-control form-control-lg"
              id="studentId"
              name="studentId"
              value="<%= studentMark != null ? studentMark.getStudentId() : "" %>"
              <%= studentMark != null ? "readonly" : "" %>
              required
            />
            <div class="invalid-feedback">Please enter a valid Student ID.</div>
          </div>

          <div class="mb-4">
            <label for="studentName" class="form-label">Student Name</label>
            <input
              type="text"
              class="form-control form-control-lg"
              id="studentName"
              name="studentName"
              value="<%= studentMark != null ? studentMark.getStudentName() : "" %>"
              required
              maxlength="100"
            />
            <div class="invalid-feedback">
              Please enter a Student Name (max 100 characters).
            </div>
          </div>

          <div class="mb-4">
            <label for="subject" class="form-label">Subject</label>
            <select
              class="form-select form-select-lg"
              id="subject"
              name="subject"
              required
            >
              <option value="" disabled selected>Select a subject</option>
              <option
                value="Mathematics"
                <%= studentMark != null && "Mathematics".equals(studentMark.getSubject()) ? "selected" : "" %>
              >Mathematics</option>
              <option
                value="Physics"
                <%= studentMark != null && "Physics".equals(studentMark.getSubject()) ? "selected" : "" %>
              >Physics</option>
              <option
                value="Chemistry"
                <%= studentMark != null && "Chemistry".equals(studentMark.getSubject()) ? "selected" : "" %>
              >Chemistry</option>
              <option
                value="Biology"
                <%= studentMark != null && "Biology".equals(studentMark.getSubject()) ? "selected" : "" %>
              >Biology</option>
              <option
                value="Computer Science"
                <%= studentMark != null && "Computer Science".equals(studentMark.getSubject()) ? "selected" : "" %>
              >Computer Science</option>
              <option
                value="English"
                <%= studentMark != null && "English".equals(studentMark.getSubject()) ? "selected" : "" %>
              >English</option>
              <option
                value="History"
                <%= studentMark != null && "History".equals(studentMark.getSubject()) ? "selected" : "" %>
              >History</option>
              <option
                value="Geography"
                <%= studentMark != null && "Geography".equals(studentMark.getSubject()) ? "selected" : "" %>
              >Geography</option>
            </select>
            <div class="invalid-feedback">Please select a Subject.</div>
          </div>

          <div class="mb-4">
            <label for="marks" class="form-label">Marks</label>
            <input
              type="number"
              class="form-control form-control-lg"
              id="marks"
              name="marks"
              min="0"
              max="100"
              value="<%= studentMark != null ? studentMark.getMarks() : "" %>"
              required
            />
            <div class="invalid-feedback">Please enter Marks (0-100).</div>
          </div>

          <div class="mb-5">
            <label for="examDate" class="form-label">Exam Date</label>
            <input
              type="date"
              class="form-control form-control-lg"
              id="examDate"
              name="examDate"
              value="<%= studentMark != null ? dateFormat.format(studentMark.getExamDate()) : "" %>"
              required
            />
            <div class="invalid-feedback">Please select a valid Exam Date.</div>
          </div>

          <div class="d-flex gap-3 justify-content-center">
            <button type="submit" class="btn btn-primary btn-lg px-5">
              Update Student Mark
            </button>
            <button type="reset" class="btn btn-secondary btn-lg px-5">
              Reset Form
            </button>
          </div>
        </form>
      </div>
    </main>
  </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Form validation -->
<script>
  (function () {
    'use strict';
    var forms = document.querySelectorAll('.needs-validation');

    Array.prototype.slice.call(forms).forEach(function (form) {
      form.addEventListener(
        'submit',
        function (event) {
          if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        },
        false
      );
    });
  })();

  // Exam date validation: cannot be future date
  document.getElementById('examDate').addEventListener('change', function () {
    const selectedDate = new Date(this.value);
    const today = new Date();

    if (selectedDate > today) {
      this.setCustomValidity('Exam date cannot be in the future');
    } else {
      this.setCustomValidity('');
    }
  });
</script>
</body>
</html>
