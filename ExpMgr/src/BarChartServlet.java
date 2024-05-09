import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/data")
public class BarChartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Retrieve existing session, don't create a new one if it doesn't exist
        if (session != null) {
            Integer userid = (Integer) session.getAttribute("currentuser");
        
        ArrayList<Integer> data = new ArrayList<>();
        ArrayList<String> labels = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null; 
        
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/expmgr","postgres","admin");
            userid = (int) session.getAttribute("currentuser"); // Assuming currentuser is an integer
            pstmt = con.prepareStatement("SELECT * FROM expenses where user_id=?");
            pstmt.setInt(1, userid);
            rs = pstmt.executeQuery();
            while(rs.next()) {
                data.add(rs.getInt("amount"));
                labels.add(rs.getString("category"));
            }
                System.out.print(data);
        } catch(Exception e) {
            System.out.println(e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        
        request.setAttribute("data", data);
        request.setAttribute("labels", arrayListToString(labels));

        RequestDispatcher dispatcher = request.getRequestDispatcher("/dataVisualization.jsp");
        dispatcher.forward(request, response);
    }
    
}
public static String arrayListToString(ArrayList<String> arrayList) {
    StringBuilder sb = new StringBuilder();
    
    for (int i = 0; i < arrayList.size(); i++) {
        sb.append(arrayList.get(i));
        if (i < arrayList.size() - 1) {
            sb.append(", ");
        }
    }
    
    return sb.toString();
}
}
