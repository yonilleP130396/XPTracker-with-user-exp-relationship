<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Landing Page</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Global Styles */
    body, html {
      font-family: 'Roboto', sans-serif;
      color: #333;
      scroll-behavior: smooth;
      background-color: #f8f9fa;
    }

    /* Hero Section */
    .hero {
      background: linear-gradient(to right, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.2)), url('https://venngage-wordpress.s3.amazonaws.com/uploads/2018/04/landing-pages-that-convert.png') no-repeat center center;
      background-size: cover;
      color: #fff;
      height: 100vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
    }
    .hero h1 {
      font-size: 3.5rem;
      font-weight: 700;
      margin-bottom: 10px;
      animation: fadeInDown 1.5s ease;
    }
    .hero p {
      font-size: 1.25rem;
      max-width: 700px;
      margin-top: 10px;
      animation: fadeInUp 1.5s ease;
    }
    .hero .btn {
      margin-top: 20px;
      font-size: 1.2rem;
      padding: 10px 30px;
      border-radius: 50px;
      animation: fadeIn 2s ease;
    }
    
    /* Additional button styles */
    .hero .btn-login {
      background-color: #007bff; /* Primary button */
      color: #fff;
      margin-right: 10px;
    }

    .hero .btn-register {
      background-color: #28a745; /* Success button */
      color: #fff;
    }

    /* Animation */
    @keyframes fadeInDown {
      from { opacity: 0; transform: translateY(-30px); }
      to { opacity: 1; transform: translateY(0); }
    }
    @keyframes fadeInUp {
      from { opacity: 0; transform: translateY(30px); }
      to { opacity: 1; transform: translateY(0); }
    }
    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }

    /* Features Section */
    .features-section {
      padding: 60px 0;
      background-color: #fff;
    }
    .features-section .feature-box {
      text-align: center;
      padding: 20px;
      transition: transform 0.3s ease;
    }
    .features-section .feature-box:hover {
      transform: translateY(-10px);
    }
    .features-section i {
      font-size: 3rem;
      color: #007bff;
      margin-bottom: 15px;
    }

    /* Footer */
    footer {
      background: #343a40;
      color: #fff;
      padding: 20px;
      text-align: center;
    }
  </style>
</head>
<body>

  <!-- Hero Section -->
  <section class="hero">
    <h1>Welcome to XPTracker</h1>
    <p>Join us in experiencing the future with cutting-edge technology and unparalleled design. Start your journey today.</p>
    <div>
      <a href="<%=request.getContextPath() %>/loginpage" class="btn btn-login">Login</a>
      <a href="<%=request.getContextPath() %>/registerform" class="btn btn-register">Register</a>
    </div>
  </section>

  <!-- Features Section -->
  <section id="features" class="features-section container">
    <div class="text-center mb-5">
      <h2>Our Key Features</h2>
      <p class="text-muted">Empowering you with the best tools and services</p>
    </div>
    <div class="row">
      <div class="col-md-4 feature-box">
        <i class="fas fa-check-circle"></i>
        <h3>Reliability</h3>
        <p>Our platform is built for consistent, top-notch performance, ensuring your success.</p>
      </div>
      <div class="col-md-4 feature-box">
        <i class="fas fa-rocket"></i>
        <h3>Speed</h3>
        <p>Experience blazing-fast speed and efficiency in every step of your journey.</p>
      </div>
      <div class="col-md-4 feature-box">
        <i class="fas fa-shield-alt"></i>
        <h3>Security</h3>
        <p>Our advanced security measures keep your data safe and secure at all times.</p>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer>
    <p>&copy; 2024 Company Name. All rights reserved.</p>
  </footer>

  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
