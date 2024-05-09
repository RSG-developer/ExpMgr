<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
int userId;
Connection con = null;
PreparedStatement stmt;
String sql;
RequestDispatcher rd;

try {
    userId = Integer.parseInt(session.getAttribute("currentuser").toString());

    Class.forName("org.postgresql.Driver");
    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/expmgr", "postgres", "admin");

    String debitSql = "INSERT INTO budget (budget_name, budget_amount, user_id) " +
                      "VALUES ('Debit Card', ?, ?) " +
                      "ON CONFLICT (budget_name, user_id) DO UPDATE SET budget_amount = EXCLUDED.budget_amount";

    String creditSql = "INSERT INTO budget (budget_name, budget_amount, user_id) " +
                       "VALUES ('Credit Card', ?, ?) " +
                       "ON CONFLICT (budget_name, user_id) DO UPDATE SET budget_amount = EXCLUDED.budget_amount";

    String cashSql = "INSERT INTO budget (budget_name, budget_amount, user_id) " +
                     "VALUES ('Cash', ?, ?) " +
                     "ON CONFLICT (budget_name, user_id) DO UPDATE SET budget_amount = EXCLUDED.budget_amount";

    String upiSql = "INSERT INTO budget (budget_name, budget_amount, user_id) " +
                    "VALUES ('UPI', ?, ?) " +
                    "ON CONFLICT (budget_name, user_id) DO UPDATE SET budget_amount = EXCLUDED.budget_amount";

    PreparedStatement debitStatement = con.prepareStatement(debitSql);
    PreparedStatement creditStatement = con.prepareStatement(creditSql);
    PreparedStatement cashStatement = con.prepareStatement(cashSql);
    PreparedStatement upiStatement = con.prepareStatement(upiSql);

    HttpSession session1 = request.getSession(true);
    session1.setAttribute("debitBudget", request.getParameter("debit"));
    session1.setAttribute("creditBudget", request.getParameter("credit"));
    session1.setAttribute("cashBudget", request.getParameter("cash"));
    session1.setAttribute("upiBudget", request.getParameter("upi"));

    debitStatement.setInt(1, Integer.parseInt(request.getParameter("debit")));
    debitStatement.setInt(2, userId);
    debitStatement.executeUpdate();

    creditStatement.setInt(1, Integer.parseInt(request.getParameter("credit")));
    creditStatement.setInt(2, userId);
    creditStatement.executeUpdate();

    cashStatement.setInt(1, Integer.parseInt(request.getParameter("cash")));
    cashStatement.setInt(2, userId);
    cashStatement.executeUpdate();

    upiStatement.setInt(1, Integer.parseInt(request.getParameter("upi")));
    upiStatement.setInt(2, userId);
    upiStatement.executeUpdate();

    %>
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    var modal = document.getElementById("myModal");
                    var okButton = document.getElementById("okButton");
                    modal.style.display = "block";
                    okButton.onclick = function() {
                        modal.style.display = "none";
                    }
                    window.onclick = function(event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                });
            </script>
    <%
    rd=request.getRequestDispatcher("budget.jsp");
    rd.include(request,response);
    // Close database connections
    debitStatement.close();
    creditStatement.close();
    cashStatement.close();
    upiStatement.close();
    con.close();
} catch (Exception e) {
    out.print(e);
}
%>
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <p>Budget Added Successfully!</p>
        <button id="okButton">OK</button>
    </div>
</div>

<style>
    /* Modal CSS */
    .modal {
        display: none; 
        position: fixed; 
        z-index: 1; 
        left: 0;
        top: 0;
        width: 100%; 
        height: 100%; 
        overflow: auto; 
        background-color: rgb(0,0,0); 
        background-color: rgba(0,0,0,0.4); 
        padding-top: 60px;
    }
    .modal-content {
        background-color: #fefefe;
        margin: 5% auto; 
        padding: 20px;
        border: 1px solid #888;
        width: 35%; 
        text-align: center;
    }
    #okButton {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }
    #okButton:hover {
        background-color: #45a049;
    }
</style>