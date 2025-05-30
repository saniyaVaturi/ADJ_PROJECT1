<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Reports Menu</title>
<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    height: 100vh;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #fff;
  }
  .container {
    background: rgba(255, 255, 255, 0.15);
    padding: 40px 60px;
    border-radius: 16px;
    box-shadow: 0 8px 24px rgba(0,0,0,0.2);
    text-align: center;
    width: 320px;
    backdrop-filter: blur(8px);
  }
  h2 {
    margin-bottom: 30px;
    font-weight: 700;
    letter-spacing: 1.5px;
    text-transform: uppercase;
    text-shadow: 0 1px 4px rgba(0,0,0,0.3);
  }
  ul {
    list-style: none;
    padding: 0;
  }
  ul li {
    margin: 18px 0;
  }
  ul li a {
    background: #fff;
    color: #2575fc;
    text-decoration: none;
    padding: 12px 25px;
    font-weight: 600;
    border-radius: 30px;
    display: inline-block;
    box-shadow: 0 5px 15px rgba(37, 117, 252, 0.4);
    transition: all 0.3s ease;
  }
  ul li a:hover {
    background: #f1f6ff;
    color: #1a4fcc;
    box-shadow: 0 8px 25px rgba(37, 117, 252, 0.7);
    transform: translateY(-3px);
  }

  /* Responsive */
  @media (max-width: 400px) {
    .container {
      width: 90%;
      padding: 30px 20px;
    }
    ul li a {
      padding: 10px 20px;
      font-size: 0.9rem;
    }
  }
</style>
</head>
<body>
  <div class="container">
    <h2>Reports Menu</h2>
    <ul>
      <li><a href="report_form.jsp">Report by Subject &amp; Marks</a></li>
      <li><a href="report">Full Report</a></li>
    </ul>
  </div>
</body>
</html>
