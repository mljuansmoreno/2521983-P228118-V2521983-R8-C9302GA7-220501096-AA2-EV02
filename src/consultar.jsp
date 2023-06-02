<!DOCTYPE html>
<html>
<head>
    <title>Consulta de Clientes</title>
</head>
<body>
    <h1>Consulta de Clientes</h1>

    <%-- Include the Java code to connect to the database and retrieve the client information --%>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%-- Establish the database connection --%>
    <% String URL = "jdbc:mysql://localhost:3308/asesoria_financiera"; %>
    <% String USUARIO = "root"; %>
    <% String CLAVE = "Workbench@1234"; %>

    <%
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USUARIO, CLAVE);

            String consulta = "SELECT * FROM clientes";
            statement = connection.prepareStatement(consulta);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombresApellidos = resultSet.getString("nombres_apellidos");
                int edad = resultSet.getInt("edad");
                String correoElectronico = resultSet.getString("correo_electronico");
                String tipoEmprendimiento = resultSet.getString("tipo_emprendimiento");
                String fechaCumple = resultSet.getString("fecha_cumple");

                // Display the client information
                out.println("ID: " + id);
                out.println("Nombres y apellidos: " + nombresApellidos);
                out.println("Edad: " + edad);
                out.println("Correo electrónico: " + correoElectronico);
                out.println("Tipo de emprendimiento: " + tipoEmprendimiento);
                out.println("Fecha de cumpleaños: " + fechaCumple);
                out.println("----------------------------------------");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the database resources
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
