import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet{
    public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
        PrintWriter out=res.getWriter();
        String name=req.getParameter("name");
        int age=Integer.parseInt(req.getParameter("age"));
        String mobile=req.getParameter("mobile");
        String usr=req.getParameter("usr");
        String pwd=req.getParameter("pwd");

        Connection con;
        Statement stmt;
        RequestDispatcher rd;
        try{
            con=DBconnect.fetchConnection();
            stmt=con.createStatement();
            int cnt=CountRecords.countRows();
            stmt.executeUpdate("insert into users values('"+(cnt+1)+"','"+name+"',"+age+",'"+mobile+"','"+usr+"','"+pwd+"')");
            out.print("<div style=color:green>Registered successfully!!!</div>");
            rd=req.getRequestDispatcher("login.html");
            rd.include(req,res);
        }catch(Exception e){
            out.print(e);
        }
    }
}
