<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Category Expense</title>
   <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> 
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      place-items: center;
      background-image: radial-gradient(grey,#c0c0c0,#dbd7d2,#91A3B0,grey);
      background-size: 100% 100%;
      background-position: center;
      display: flex;
      animation: bg-animation 15s infinite alternate;
      overflow-y: hidden;
      padding: 20px;
    }
    
    @keyframes bg-animation {
      0% {
        background-size: 100% 100%; 
      }
      50% {
        background-size: 150% 150%;
      }
      100% {
        background-size: 100% 100%;
      }
    }
    
    .container {
      margin-top:70px;
      background-color:azure;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      background-color: white;
    }
    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background:linear-gradient(-130deg,azure, cyan,#4158d0      ,lightblue);
    }
    .total {
      font-weight: bold;
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
       margin-bottom: 25px;;
    }
    </style>
    </head>
    <body>
     
        <table >
            <thead>
                <tr>
                    <th>Category</th>
                    <th>Expense amount</th>
                </tr>
            </thead>  
            <tbody>
<%@ page language="java" import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<%
    String start_date = request.getParameter("startDate");
    String end_date = request.getParameter("endDate");

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    int userId;
    
    int total = 0;
    try {
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/expmgr","postgres","admin");
        
        // Check if session attribute is not null and is an instance of Integer
        Object currentUser = session.getAttribute("currentuser");
        if (currentUser == null || !(currentUser instanceof Integer)) {
            throw new ServletException("User ID is not available in session.");
        }
        userId = (Integer) currentUser;
        
        // Use PreparedStatement to avoid SQL injection
        String sql = "SELECT category, amount FROM expenses WHERE date BETWEEN ? AND ? AND user_id = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, start_date);
        pstmt.setString(2, end_date);
        pstmt.setInt(3, userId);

        rs = pstmt.executeQuery();
        
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getString("category") + "</td>");
            out.println("<td>" + rs.getInt("amount") + "</td>");
            out.println("</tr>");
            total += rs.getInt("amount");
        }
        
    } catch (Exception e) {
        out.print("An error occurred: " + e.getMessage());
        
    } finally {
        // Close resources in a finally block to ensure they are always closed
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    %>
    </tbody>
    <tfoot>
        <tr>
            <td class="total">Total</td>
            <td class="total" id="totalAmount"><%=total%></td>
        </tr>
    </tfoot>
    </table>
    </body>
    </html>
