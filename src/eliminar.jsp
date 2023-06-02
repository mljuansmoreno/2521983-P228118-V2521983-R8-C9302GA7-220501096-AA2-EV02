<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.PreparedStatement" %> 
<%@ page import="java.sql.SQLException" %> 

<%
    String URL = "jdbc:mysql://localhost:3308/asesoria_financiera";
    String USUARIO = "root";
    String CLAVE = "Workbench@1234";
    int id = Integer.parseInt(request.getParameter("id"));

    try {
        Connection connection = DriverManager.getConnection(URL, USUARIO, CLAVE);
        String consulta = "DELETE FROM clientes WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(consulta);
        statement.setInt(1, id);
        int filasEliminadas = statement.executeUpdate();
        if (filasEliminadas > 0) {
            out.println("Registro eliminado correctamente.");
        } else {
            out.println("No se encontró el registro.");
        }
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
