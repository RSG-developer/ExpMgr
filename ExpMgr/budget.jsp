<%@ page language="java" import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<%
String uname = null;
int u_id = 0;
int debitBalance = 0;
int creditBalance = 0;
int cashBalance = 0;
int upiBalance = 0;

// Retrieve user information and balance from the database
try {
    if (session == null || session.getAttribute("currentuser") == null) {
        response.sendRedirect("login.html");
    } else {
        u_id = Integer.parseInt(session.getAttribute("currentuser").toString());
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/expmgr","postgres","admin");
            
            // Retrieve username
            PreparedStatement pstmt = con.prepareStatement("SELECT uname FROM users WHERE user_id=?");
            pstmt.setInt(1, u_id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                uname = rs.getString("uname");
            }
            rs.close();
            pstmt.close();
            
            // Retrieve latest balance values for the user
            pstmt = con.prepareStatement("SELECT * FROM budget WHERE user_id=? ORDER BY budget_id DESC");
            pstmt.setInt(1, u_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String budgetName = rs.getString("budget_name");
                int budgetAmount = rs.getInt("budget_amount");
                
                // Assign the retrieved budget amounts to the appropriate variables
                switch(budgetName) {
                    case "Debit Card":
                        debitBalance = budgetAmount;
                        break;
                    case "Credit Card":
                        creditBalance = budgetAmount;
                        break;
                    case "Cash":
                        cashBalance = budgetAmount;
                        break;
                    case "UPI":
                        upiBalance = budgetAmount;
                        break;
                }
            }
            
            // Close resources
            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} catch (IOException e) {
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accounts</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            place-items: center;
            background-image: radial-gradient(grey,#c0c0c0,#dbd7d2,#91A3B0,grey);
            background-size: 100% 100%;
            background-position: center;
            display: flex;
            animation: bg-animation 30s infinite alternate;
            overflow-y: hidden;
            padding: 20px;
        }
        @keyframes bg-animation {
          0% {
            background-size: 100% 100%; 
          }
          50% {
            background-size: 200% 200%;
          }
          100% {
            background-size: 100% 100%;
          }
        }

        .container {
            background-color:azure;
            margin-top:60px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .title
    {
      padding:11px;
       font-size: 35px;
       font-weight: 600;
       text-align: center;
       line-height: 60px;
       color: #fff;
       user-select: none;
       border-radius: 15px;
       background: linear-gradient(-130deg,azure,cyan, #4158d0,lightblue);
       margin-bottom: 60px;
    }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color:white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            
        }

        th,
        td {
            padding: 15px;
            text-align: center ;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
            text-transform: uppercase;
        }

        td {
            font-weight: 500;
        }

        .total {
            font-weight: bold;
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
        input[type="submit"]{
          color: #fff;
          border: none;
          width: 33%;
          padding: 5px;;
          cursor: pointer;
          border-radius: 10px;;
          background: linear-gradient(-135deg,grey,#c0c0c0,#91A3B0,grey);
           background-size:125%;
          transition: all 0.3s ease;
        }
        button:hover{
          animation:bg-animation 2s infinite alternate;
          color:black;
          }
        form{
          height:70vh;
        }
         
    </style>
    <script>
      function updateBalance(inputId, balanceId) {
          var inputElement = document.getElementById(inputId);
          var balanceElement = document.getElementById(balanceId);
          var newBudget = parseFloat(inputElement.value || 0);
          balanceElement.innerText = 'Rs.' + newBudget.toFixed(2);
      }
  </script>
</head>

<body>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top">
    <a class="navbar-brand" href="#">
      <img src="./images/expmgr1.png" alt="Expense Manager Logo" style="border-radius:30px">
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
  <form action="addBudget.jsp" method="post" class="container">
    <h2 class="title">BUDGET</h2>
    <table id="accountTable" class="table table-hover">
        <thead>
            <tr>
                <th>Account Type</th>
                <th>Budget</th>
                <th>Set Budget</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Debit Card</td>
                <td id="debitBalance"><%= "Rs. "+ debitBalance %></td>
                <td><input type="number" name="debit" id="debitInput" placeholder="Debit Budget" required oninput="updateBalance('debitInput', 'debitBalance')"></td>
            </tr>
            <tr>
                <td>Credit Card</td>
                <td id="creditBalance"><%= "Rs. "+ creditBalance %></td>
                <td><input type="number" name="credit" id="creditInput" placeholder="Credit Budget" required oninput="updateBalance('creditInput', 'creditBalance')"></td>
            </tr>
            <tr>
                <td>Cash</td>
                <td id="cashBalance"><%= "Rs. "+ cashBalance %></td>
                <td><input type="number" name="cash" id="cashInput" placeholder="Cash Budget" required oninput="updateBalance('cashInput', 'cashBalance')"></td>
            </tr>
            <tr>
                <td>UPI</td>
                <td id="upiBalance"><%= "Rs. "+ upiBalance %></td>
                <td><input type="number" name="upi" id="upiInput" placeholder="UPI Budget" required oninput="updateBalance('upiInput', 'upiBalance')"></td>
            </tr>
        </tbody>
    </table>
    <center><input type="submit" value="Set"></center>
</form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
 