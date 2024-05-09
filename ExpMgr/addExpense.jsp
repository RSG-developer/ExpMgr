<%@ page language="java" import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*" %>
<%
    int maxId = -1;
    Connection con = null;
    Statement stmt;
    PreparedStatement pstmt;
    ResultSet rs=null;
    RequestDispatcher rd;
    String sql;
    try{
        Class.forName("org.postgresql.Driver");
        con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/expmgr","postgres","admin");
        sql = "SELECT MAX(exp_id) AS exp_id FROM expenses"; // Specify your table name
        stmt = con.createStatement();
        rs = stmt.executeQuery(sql);
        if (rs.next()) {
            maxId = rs.getInt("exp_id");
        }
    }catch(Exception e){
        out.print(e);
    }
    
    int userId;
    int ans;
    int amt=Integer.parseInt(request.getParameter("amount"));
    String cate=request.getParameter("category");
    String date=request.getParameter("date");
    String mop=request.getParameter("payment-mode");
    try{
        userId= Integer.parseInt(session.getAttribute("currentuser").toString());
        stmt=con.createStatement();

        
        String budgetName = mop; // Replace with your budget name
        String budgetSql = "SELECT budget_amount FROM budget WHERE budget_name = '" + budgetName + "' AND user_id = " + userId;
        ResultSet budgetRs = stmt.executeQuery(budgetSql);
        int budgetAmount = 0;
        if (budgetRs.next()) {
            budgetAmount = budgetRs.getInt("budget_amount");
        }
        if(amt < budgetAmount){
            ans=stmt.executeUpdate("insert into expenses values('"+(maxId+1)+"','"+amt+"','"+cate+"','"+date+"','"+mop+"','"+userId+"')");
            if(ans>0){
                %>
                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        var modal = document.getElementById("myModal");
                        var okButton = document.getElementById("okButton");
                        modal.style.display = "block";
                        var text=document.getElementById('text').innerHTML='Expense added successfully!';
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
            }
            // Calculate the difference between budget and expense amount
            int difference = budgetAmount - amt;
    
            // Insert or update the difference into the account table
            String insertAccountSql = "INSERT INTO accounts (account_name, account_balance, user_id) VALUES ('" + mop + "', " + difference + ", " + userId + ") " +
                                    "ON CONFLICT (account_name, user_id) DO UPDATE SET account_balance = " + difference;
            stmt.executeUpdate(insertAccountSql);
        }
        else{
            %>
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    var modal = document.getElementById("myModal");
                    var okButton = document.getElementById("okButton");
                    modal.style.display = "block";
                    var text=document.getElementById('text').innerText='You are exceeding the budget limit.Please update budget limit first';
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
        }
        rd=request.getRequestDispatcher("expense.jsp");
        rd.include(request,response);
    }catch(Exception e){
        out.print(e);
    }
%>
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <p id="text"></p>
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
