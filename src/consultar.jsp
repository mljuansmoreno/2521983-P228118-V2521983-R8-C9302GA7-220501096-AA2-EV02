<!DOCTYPE html>
<html>
<head>
    <title>Consulta de Clientes</title>
</head>
<body>
    <h1>Consulta de Clientes</h1>

    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%
        // Detalles de conexión de base de datos
        String URL = "jdbc:mysql://localhost:3308/asesoria_financiera";
        String USUARIO = "root";
        String CLAVE = "Workbench@1234";

        try {
            // Establecer conexión con la base de datos
            Connection connection = DriverManager.getConnection(URL, USUARIO, CLAVE);

            // Preparar la consulta SQL
            String consulta = "SELECT * FROM clientes";
            PreparedStatement statement = connection.prepareStatement(consulta);

            // Ejecutar la consulta y obtener el resultado
            ResultSet resultSet = statement.executeQuery();

            // Mostrar la información de los clientes
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombresApellidos = resultSet.getString("nombres_apellidos");
                int edad = resultSet.getInt("edad");
                String correoElectronico = resultSet.getString("correo_electronico");
                String tipoEmprendimiento = resultSet.getString("tipo_emprendimiento");
                String fechaCumple = resultSet.getString("fecha_cumple");

                out.println("ID: " + id);
                out.println("Nombres y apellidos: " + nombresApellidos);
                out.println("Edad: " + edad);
                out.println("Correo electrónico: " + correoElectronico);
                out.println("Tipo de emprendimiento: " + tipoEmprendimiento);
                out.println("Fecha de cumpleaños: " + fechaCumple);
                out.println("----------------------------------------");
            }

            // Cerrar los recursos de la base de datos
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
