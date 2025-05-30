<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Generate Reports - Mark Management System</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />

<!-- Custom CSS -->
<style>
  @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

  body {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    font-family: 'Poppins', sans-serif;
    color: #333;
    min-height: 100vh;
    padding: 40px 0;
  }

  .container {
    max-width: 1100px;
  }

  /* Sidebar */
  .sidebar-card {
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(12px);
    border-radius: 15px;
    box-shadow: 0 12px 25px rgba(102, 126, 234, 0.3);
    color: #fff;
  }
  .sidebar-card .card-header {
    background: transparent;
    border-bottom: none;
    font-weight: 700;
    font-size: 1.4rem;
    letter-spacing: 1px;
    padding: 1.25rem 1.5rem;
  }
  .sidebar-card .nav-link {
    color: #d1d1ff;
    font-weight: 500;
    font-size: 1.05rem;
    padding: 0.8rem 1.5rem;
    transition: color 0.3s ease;
    border-radius: 50px;
  }
  .sidebar-card .nav-link:hover {
    color: #fff;
    background: rgba(255, 255, 255, 0.25);
  }
  .sidebar-card .nav-link.active {
    background: #5a4dff;
    color: #fff;
    font-weight: 700;
    box-shadow: 0 4px 15px rgba(90, 77, 255, 0.7);
  }

  /* Main Card */
  .main-card {
    background: #fff;
    border-radius: 20px;
    box-shadow: 0 16px 35px rgba(0,0,0,0.1);
    padding: 2.5rem 3rem;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }
  .main-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 25px 50px rgba(0,0,0,0.15);
  }

  .main-card .card-header {
    font-weight: 700;
    font-size: 1.7rem;
    color: #5a4dff;
    border-bottom: none;
    padding-bottom: 0;
  }

  /* Report Options */
  .report-option {
    border: 2.5px solid #d7d7f4;
    border-radius: 18px;
    padding: 30px 25px;
    cursor: pointer;
    box-shadow: 0 8px 20px rgba(90, 77, 255, 0.08);
    transition: all 0.35s ease;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    height: 210px;
  }
  .report-option:hover {
    border-color: #5a4dff;
    box-shadow: 0 20px 40px rgba(90, 77, 255, 0.25);
    background-color: #f0f1ff;
  }
  .report-option.selected {
    border-color: #5a4dff;
    background-color: #ebeaff;
    box-shadow: 0 20px 40px rgba(90, 77, 255, 0.4);
  }

  .report-icon {
    font-size: 48px;
    color: #5a4dff;
    margin-bottom: 15px;
    user-select: none;
  }
  .report-option h6 {
    font-weight: 600;
    font-size: 1.25rem;
    margin-bottom: 8px;
    color: #3b3b9d;
  }
  .report-option p {
    font-size: 0.9rem;
    color: #7a7aaf;
  }

  /* Criteria Card */
  #criteriaContainer {
    background: #f9faff;
    border-radius: 15px;
    padding: 20px 30px;
    box-shadow: 0 14px 40px rgba(90, 77, 255, 0.15);
    margin-bottom: 25px;
    display: none;
  }
  #criteriaContainer .card-header {
    background: #5a4dff;
    color: #fff;
    font-weight: 600;
    border-radius: 15px 15px 0 0;
    padding: 1rem 1.5rem;
    font-size: 1.25rem;
  }
  #criteriaContent label.form-label {
    font-weight: 600;
    color: #4e4eaa;
  }

  /* Buttons */
  #generateBtn {
    background: #5a4dff;
    border: none;
    font-weight: 700;
    font-size: 1.15rem;
    padding: 12px;
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(90, 77, 255, 0.3);
    transition: background 0.3s ease;
  }
  #generateBtn:disabled {
    background: #bbbcee;
    box-shadow: none;
    cursor: not-allowed;
  }
  #generateBtn:hover:not(:disabled) {
    background: #4438c3;
  }

  /* Instructions Card */
  .instructions-card {
    background: #fff;
    border-radius: 20px;
    box-shadow: 0 16px 35px rgba(0,0,0,0.1);
    padding: 2rem 2.5rem;
    color: #3c3c8a;
  }
  .instructions-card .card-header {
    background: #5a4dff;
    color: #fff;
    font-weight: 700;
    font-size: 1.3rem;
    border-radius: 20px 20px 0 0;
    border-bottom: none;
  }
  .instructions-card ul {
    padding-left: 1.25rem;
  }
  .instructions-card ul li {
    margin-bottom: 0.8rem;
    font-size: 1rem;
  }
  .instructions-card .alert-info {
    background: #e1e6ff;
    color: #3b3b9d;
    font-weight: 600;
    border-radius: 12px;
  }
</style>
</head>
<body>
<div class="container">
  <div class="row g-4">
    <div class="col-lg-3">
      <div class="card sidebar-card">
        <div class="card-header">Navigation</div>
        <div class="card-body p-0">
          <ul class="nav nav-pills flex-column mb-0">
            <li class="nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
            <li class="nav-item"><a href="markadd.jsp" class="nav-link">Add Marks</a></li>
            <li class="nav-item"><a href="markupdate.jsp" class="nav-link">Update Marks</a></li>
            <li class="nav-item"><a href="markdelete.jsp" class="nav-link">Delete Marks</a></li>
            <li class="nav-item"><a href="DisplayMarksServlet" class="nav-link">Display Marks</a></li>
            <li class="nav-item"><a href="report_form.jsp" class="nav-link active">Generate Reports</a></li>
          </ul>
        </div>
      </div>
    </div>

    <div class="col-lg-9 d-flex flex-column gap-4">
      <div class="main-card">
        <div class="card-header">Generate Reports</div>
        <form action="ReportServlet" method="post" id="reportForm" novalidate>
          <h5 class="mb-4 text-primary fw-semibold">Select Report Type</h5>
          <div class="row g-3">
            <div class="col-md-4">
              <div class="report-option" data-report="aboveThreshold" tabindex="0" role="button" aria-pressed="false">
                <span class="report-icon" aria-hidden="true">📊</span>
                <h6>Students Above Threshold</h6>
                <p>Find students with marks above a specified value</p>
                <input type="radio" name="reportType" value="aboveThreshold" class="d-none" />
              </div>
            </div>

            <div class="col-md-4">
              <div class="report-option" data-report="bySubject" tabindex="0" role="button" aria-pressed="false">
                <span class="report-icon" aria-hidden="true">📚</span>
                <h6>Students by Subject</h6>
                <p>View all students who took a specific subject</p>
                <input type="radio" name="reportType" value="bySubject" class="d-none" />
              </div>
            </div>

            <div class="col-md-4">
              <div class="report-option" data-report="topStudents" tabindex="0" role="button" aria-pressed="false">
                <span class="report-icon" aria-hidden="true">🏆</span>
                <h6>Top Students</h6>
                <p>Display top N students based on their marks</p>
                <input type="radio" name="reportType" value="topStudents" class="d-none" />
              </div>
            </div>
          </div>

          <div id="criteriaContainer" class="mt-5">
            <div class="card">
              <div class="card-header">Report Criteria</div>
              <div class="card-body" id="criteriaContent"></div>
            </div>
          </div>

          <div class="d-grid mt-4">
            <button type="submit" id="generateBtn" class="btn" disabled>Generate Report</button>
          </div>
        </form>
      </div>

      <div class="card instructions-card">
        <div class="card-header">Instructions</div>
        <div class="card-body">
          <h6>Report Types:</h6>
          <ul>
            <li><strong>Students Above Threshold:</strong> Enter a minimum marks value to find all students who scored above that threshold.</li>
            <li><strong>Students by Subject:</strong> Select a subject to view all students who took that subject.</li>
            <li><strong>Top Students:</strong> Enter the number of top-performing students you want to display.</li>
          </ul>
          <div class="alert alert-info mt-3" role="alert">
            <strong>Note:</strong> Select a report type above to see the specific criteria options for that report.
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Script to handle report option selection and criteria display -->
<script>
  const reportOptions = document.querySelectorAll('.report-option');
  const criteriaContainer = document.getElementById('criteriaContainer');
  const criteriaContent = document.getElementById('criteriaContent');
  const generateBtn = document.getElementById('generateBtn');

  reportOptions.forEach(option => {
    option.addEventListener('click', () => selectReport(option));
    option.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        selectReport(option);
      }
    });
  });

  function selectReport(option) {
    // Clear previous selection
    reportOptions.forEach(opt => {
      opt.classList.remove('selected');
      opt.setAttribute('aria-pressed', 'false');
      opt.querySelector('input[type="radio"]').checked = false;
    });

    // Set new selection
    option.classList.add('selected');
    option.setAttribute('aria-pressed', 'true');
    option.querySelector('input[type="radio"]').checked = true;

    // Show criteria form
    showCriteriaFor(option.dataset.report);
    generateBtn.disabled = false;
  }

  function showCriteriaFor(reportType) {
    criteriaContainer.style.display = 'block';
    let content = '';

    switch (reportType) {
      case 'aboveThreshold':
        content = `
          <div class="mb-3">
            <label for="threshold" class="form-label">Minimum Marks Threshold</label>
            <input type="number" id="threshold" name="threshold" class="form-control" min="0" max="100" placeholder="Enter minimum marks (0-100)" required />
            <div class="form-text">Students with marks equal to or above this value will be included in the report.</div>
          </div>
        `;
        break;

      case 'bySubject':
        content = `
          <div class="mb-3">
            <label for="subject" class="form-label">Select Subject</label>
            <select id="subject" name="subject" class="form-select" required>
              <option value="" disabled selected>Choose a subject</option>
              <option>Mathematics</option>
              <option>Physics</option>
              <option>Chemistry</option>
              <option>Biology</option>
              <option>Computer Science</option>
              <option>English</option>
              <option>History</option>
              <option>Geography</option>
            </select>
            <div class="form-text">All students who took the selected subject will be included in the report.</div>
          </div>
        `;
        break;

      case 'topStudents':
        content = `
          <div class="mb-3">
            <label for="count" class="form-label">Number of Top Students</label>
            <input type="number" id="count" name="count" class="form-control" min="1" max="100" placeholder="Enter number of students" required />
            <div class="form-text">The top performers based on marks will be displayed in descending order.</div>
          </div>
        `;
        break;
    }

    criteriaContent.innerHTML = content;
  }
</script>
</body>
</html>
