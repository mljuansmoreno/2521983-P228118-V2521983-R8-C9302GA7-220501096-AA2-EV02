<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.PreparedStatement" %> 
<%@ page import="java.sql.SQLException" %> 

<%
    String URL = "jdbc:mysql://localhost:3308/asesoria_financiera";
    String USUARIO = "root";
    String CLAVE = "Workbench@1234";
    int id = Integer.parseInt(request.getParameter("id"));
    String nuevoCorreoElectronico = request.getParameter("nuevoCorreoElectronico");

    try {
        Connection connection = DriverManager.getConnection(URL, USUARIO, CLAVE);
        String consulta = "UPDATE clientes SET correo_electronico = ? WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(consulta);
        statement.setString(1, nuevoCorreoElectronico);
        statement.setInt(2, id);
        int filasActualizadas = statement.executeUpdate();
        if (filasActualizadas > 0) {
            out.println("Registro actualizado correctamente.");
        } else {
            out.println("No se encontró el registro.");
        }
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
