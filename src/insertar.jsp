<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.PreparedStatement" %> 
<%@ page import="java.sql.SQLException" %> 

<%
    String URL = "jdbc:mysql://localhost:3308/asesoria_financiera";
    String USUARIO = "root";
    String CLAVE = "Workbench@1234";
    String nombresApellidos = request.getParameter("nombresApellidos");
    int edad = Integer.parseInt(request.getParameter("edad"));
    String correoElectronico = request.getParameter("correoElectronico");
    String tipoEmprendimiento = request.getParameter("tipoEmprendimiento");
    String fechaCumple = request.getParameter("fechaCumple");

    try {
        Connection connection = DriverManager.getConnection(URL, USUARIO, CLAVE);
        String consulta = "INSERT INTO clientes (nombres_apellidos, edad, correo_electronico, tipo_emprendimiento, fecha_cumple) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(consulta);
        statement.setString(1, nombresApellidos);
        statement.setInt(2, edad);
        statement.setString(3, correoElectronico);
        statement.setString(4, tipoEmprendimiento);
        statement.setString(5, fechaCumple);
        statement.executeUpdate();
        out.println("Registro insertado correctamente.");
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
