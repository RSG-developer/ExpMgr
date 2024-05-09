import java.sql.*;
public class DBconnect {
    public static Connection fetchConnection(){
        String driver="org.postgresql.Driver";
        String dbURL="jdbc:postgresql://localhost/";
        String db="expmgr";
        String dbUser="postgres";
        String dbPwd="admin";
        Connection con=null;
        try{
            Class.forName("org.postgresql.Driver");
            con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/expmgr","postgres","admin");
        }catch(ClassNotFoundException cnfe){
            System.out.println(cnfe);
        }catch(SQLException se){
            System.out.println(se);
        }
        return con;
    }
}
