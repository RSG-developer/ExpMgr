<%@ page language="java" import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<%
String uname=null;
Connection con = null;
PreparedStatement stmt = null;
ResultSet rs = null;
int u_id;
try {
    if (session == null || session.getAttribute("currentuser") == null) {
        response.sendRedirect("login.html");
    } else {
        u_id = Integer.parseInt(session.getAttribute("currentuser").toString());
        try {
            Class.forName("org.postgresql.Driver");
            con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/expmgr","postgres","admin");
            stmt = con.prepareStatement("SELECT uname FROM users WHERE user_id=?");
            stmt.setInt(1, u_id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                uname = rs.getString("uname").toString();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
  }catch (IOException e) {
      e.printStackTrace();
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Expense</title>
  <link rel="stylesheet" href="expense.css">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }
    .container {
      width: 50%;
      margin: 20px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      animation: fadeIn 1s ease-in-out;
    }
    input[type="text"], select, input[type="date"] {
      width: 100%;
      padding: 10px;
      margin: 5px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
    }
    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    input[type="submit"]:hover {
      background-color: #45a049;
    }
    @keyframes fadeIn {
      0% {
        opacity: 0;
        transform: translateY(-20px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }
  </style>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 
</head>
<body>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top">
    <a class="navbar-brand" href="#">
      <img src="./images/expmgr1.png" alt="Expense Manager Logo">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="homepage.jsp">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#exampleModal" id="username"><i class="fa-solid fa-user"></i> <%=uname %></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./LogoutServlet"><i class="fa-solid fa-arrow-right-from-bracket"></i></a>
        </li>
      </ul>
    </div>
  </nav>

<div class="wrapper">
 
  <div class="title">
  <h2>ADD EXPENSE</h2>
  </div>
  <form id="expense-form" onsubmit="return validateForm()" action="addExpense.jsp" autocomplete="off" >
    <label for="amount">Expense Amount:</label>
    <input type="text" id="amount" name="amount" placeholder="Enter expense amount.." required>
    <br>
    <label for="category">Category:</label>
    <input type="text" id="category" name="category" placeholder="Type in the category" required>
    <br>
    <label for="date">Date:</label>
    <input type="date" id="date" name="date" required>
    <br>
    <label for="payment-mode">Mode of Payment:</label>
    <select id="payment-mode" name="payment-mode" required>
      <option value="Cash">Cash</option>
      <option value="Debit Card">Debit Card</option>
      <option value="Credit Card">Credit Card</option>
      <option value="UPI">UPI</option>
     
    </select>
    <br>
    <div class="field">
    <input type="submit" value="ADD" >
    </div>
  </form>
</div>


<script>
  function validateForm() {
    var amount = document.getElementById("amount").value;
    var date = document.getElementById("date").value;

   
    if (amount.trim() == "" || date.trim() == "" || category.trim()=="") {
      alert("Please fill out all fields.");
      return false;
    }
    else{
      alert('Expense Added Successfully!')
    
    return true;
    }
    
  }
</script>

</body>
</html>
