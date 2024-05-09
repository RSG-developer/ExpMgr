import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ForgotServlet extends HttpServlet{
	public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		PrintWriter out=res.getWriter();
		String usr=req.getParameter("usr");
		String npwd=req.getParameter("newpwd");
		String cpwd=req.getParameter("conpwd");
		
		Connection con;
        Statement stmt;
        RequestDispatcher rd;
        int ans;
        try{
            con=DBconnect.fetchConnection();
            stmt=con.createStatement();
            if(npwd.equals(cpwd)){
	            ans=stmt.executeUpdate("update users set pname='"+npwd+"' where uname='"+usr+"'");
	            if(ans!=0){
			            out.print("<div style=color:green>Password changed successfully!!!</div>");
			            rd=req.getRequestDispatcher("login.html");
			            rd.include(req,res);
	            	}
	            	else{
	            		out.print("<div style=color:red>User does not exist.<br>Please create an account!!!</div>");
	                    rd=req.getRequestDispatcher("forgot.html");
	                    rd.include(req,res);	       
	            	}
            }
            else{
            	out.print("<div style=color:red>Please enter Similar password</div>");
                rd=req.getRequestDispatcher("forgot.html");
                rd.include(req,res);
            }
        }catch(Exception e){
        	out.print(e);
        }
	}
}