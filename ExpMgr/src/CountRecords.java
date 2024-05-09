import java.sql.*;
public class CountRecords{
    public static int countRows() {
        int rowCount = 0;
        String query;
        Connection con = null;
        Statement stmt;
        ResultSet rs;
        try{
            Class.forName("org.postgresql.Driver");
            query= "SELECT COUNT(*) FROM users";
            con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/expmgr","postgres","admin");
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();

            rowCount = rs.getInt(1);
 
        } catch (SQLException se) {
            System.out.println(se);
        }catch(ClassNotFoundException cnfe){
            System.out.println(cnfe);
        }catch(Exception e){
            System.out.println(e);
        }
        
        return rowCount;
    }
}

