
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Expense Manager</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
   
  <style>
    body {
      padding-top: 50px;
      font-family: 'Roboto', sans-serif;
      background-image:radial-gradient(grey,#c0c0c0,#dbd7d2,#91A3B0,grey);
      background-size:400%;
      display:flex;
      animation:bg-animation 30s infinite alternate;
      overflow-y: scroll;
    
    }
    @keyframes bg-animation{
      0%
      {
        background-position:left;
      }
      100%{
        background-position:right;
      }
    }
    .division {
      margin: 30px;
      margin-top: 50px;
      padding: 40px;
      background-color:azure;
      border-radius: 20px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      transition: all 0.3s ease;
      text-align: center;
      cursor: pointer;
      height: auto;
      width: auto;
    }
    .division:hover {
      transform: translateY(-5px);
      box-shadow: 0 20px 40px rgba(22, 22, 243, 0.2);
      background-image:linear-gradient(cyan,white);
      animation: hoverAnimation 0.3s forwards;
    }
    .division a {
      text-decoration: none;
      color: azure;
      font-size: 24px;
      transition: color 0.4s ease;
    }
    .division:hover a {
      color: blue;
    }
    .division:hover p {
      color: rgb(19, 2, 41);
    }
    .division:hover h3 {
      font-size:32px;
    }
    .division h3 {
      font-size: 28px;
      margin-bottom: 20px;
      color: #343a40;
    }
    .division p {
      font-size: 18px;
      color: #6c757d;
    }
    header {
      margin-bottom: 3vh;
      margin-top: -20px;
      font: size 1vw;
    }
    p,
    h3 {
      font-size: auto;
    }
    .navbar-brand img {
      max-height: 40px;
    }
    .navbar {
      background: linear-gradient(270deg, #2d388a, #00aeef);
    }
    .nav-link:hover a {
      color: white;
    }
    @keyframes hoverAnimation {
      0% {
        transform: translateY(0);
      }
      50% {
        transform: translateY(-10px);
      }
      100% {
        transform: translateY(0);
      }
    }
  </style>
</head>
<body>
  
  <%@include file="navbar.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <div class="division">
          <h3>EXPENSE</h3>
          <p>Track and manage your expenses efficiently.</p>
          <a href="./expense.jsp">Get Started</a>
        </div>
      </div>
      <div class="col-md-4">
        <div class="division">
          <h3>CATEGORY</h3>
          <p>Organize your expenses into categories.</p>
          <a href="category.jsp">Explore Categories</a>
        </div>
      </div>
      <div class="col-md-4">
        <div class="division">
          <h3>REPORTS</h3>
          <p>Your spendings with detailed reports.</p>
          <a href="./BarChartServlet">View Reports</a>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-4">
        <div class="division">
          <h3>ACCOUNTS</h3>
          <p>View accounts</p>
          <a href="account.jsp">Manage Accounts</a>
        </div>
      </div>
      <div class="col-md-4">
        <div class="division">
          <h3>BUDGET</h3>
          <p>Set and view budget.</p>
          <a href="budget.jsp">Budget Settings</a>
        </div>
      </div>
      <div class="col-md-4">
        <div class="division">
          <h3>ABOUT US</h3>
          <p>How we made it.</p>
          <a href="aboutus.jsp">Learn More</a>
        </div>
      </div>
    </div>
  </div>
  <!-- profile modal -->
      <!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"> -->
    <!-- Launch demo modal -->
  <!-- </button> -->
  
  
</body>
</html>
