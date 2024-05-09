import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet{
    public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
        PrintWriter out=res.getWriter();
        
        String usr=req.getParameter("user");
        String pwd=req.getParameter("pwd");

        RequestDispatcher rd;
        Connection con=null;
        Statement stmt;
        ResultSet rs;

        try{
            con=DBconnect.fetchConnection();
            stmt=con.createStatement();
            // rs=stmt.executeQuery("select * from users where uname='"+usr+"' and pname='"+pwd+"'");
            
           rs=stmt.executeQuery("select user_id from users where uname='"+usr+"' and pname='"+pwd+"'");
            
            if (rs.next()) {
                int userId = rs.getInt("user_id");
                HttpSession session = req.getSession();
                session.setAttribute("currentuser", userId);
                res.sendRedirect("homepage.jsp");
            
            }
            else{
                out.print("<div style=color:red>Login Failed!!!</div>");
                rd=req.getRequestDispatcher("login.html");
                rd.include(req,res);
            }

        }catch(Exception e){
            out.print(e);
        }
    }
}

