import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class NameServlet extends HttpServlet
{
    public void doGet(HttpServletRequest req,HttpServletResponse resp)throws IOException,ServletException
    {

        HttpSession session=req.getSession();
        if(session.getAttribute("user")==null){
            resp.sendRedirect("./login.html");
            return;
        }
        String username=(String)session.getAttribute("user");
        req.setAttribute("user",username);
        resp.getWriter().println("<h1>"+username+"</h1>");
       //req.getRequestDispatcher("./Main.html").forward(req,resp);
    }
}