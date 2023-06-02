import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Principal {
    private static final String URL = "jdbc:mysql://localhost:3308/asesoria_financiera";
    private static final String USUARIO = "root";
    private static final String CLAVE = "Workbench@1234";
    private static final Scanner scanner = new Scanner(System.in);

    public Principal() {
    }

    public void insertar() {
        System.out.println("Ingrese los siguientes datos del cliente:");
        System.out.print("Nombres y apellidos: ");
        String nombresApellidos = scanner.nextLine();
        System.out.print("Edad: ");
        int edad = scanner.nextInt();
        scanner.nextLine(); // Consume the remaining newline character
        System.out.print("Correo electrónico: ");
        String correoElectronico = scanner.nextLine();
        System.out.print("Tipo de emprendimiento: ");
        String tipoEmprendimiento = scanner.nextLine();
        System.out.print("Fecha de cumpleaños (YYYY-MM-DD): ");
        String fechaCumple = scanner.nextLine();

        try (Connection connection = DriverManager.getConnection(URL, USUARIO, CLAVE)) {
            String consulta = "INSERT INTO clientes (nombres_apellidos, edad, correo_electronico, tipo_emprendimiento, fecha_cumple) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(consulta);
            statement.setString(1, nombresApellidos);
            statement.setInt(2, edad);
            statement.setString(3, correoElectronico);
            statement.setString(4, tipoEmprendimiento);
            statement.setString(5, fechaCumple);
            statement.executeUpdate();
            System.out.println("Registro insertado correctamente.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void consultar() {
        try (Connection connection = DriverManager.getConnection(URL, USUARIO, CLAVE)) {
            String consulta = "SELECT * FROM clientes";
            PreparedStatement statement = connection.prepareStatement(consulta);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombresApellidos = resultSet.getString("nombres_apellidos");
                int edad = resultSet.getInt("edad");
                String correoElectronico = resultSet.getString("correo_electronico");
                String tipoEmprendimiento = resultSet.getString("tipo_emprendimiento");
                String fechaCumple = resultSet.getString("fecha_cumple");
                System.out.println("ID: " + id);
                System.out.println("Nombres y apellidos: " + nombresApellidos);
                System.out.println("Edad: " + edad);
                System.out.println("Correo electrónico: " + correoElectronico);
                System.out.println("Tipo de emprendimiento: " + tipoEmprendimiento);
                System.out.println("Fecha de cumpleaños: " + fechaCumple);
                System.out.println("----------------------------------------");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void actualizar() {
        System.out.print("Ingrese el ID del cliente que desea actualizar: ");
        int id = scanner.nextInt();
        scanner.nextLine(); // Consume the remaining newline character
        System.out.print("Ingrese el nuevo correo electrónico: ");
        String nuevoCorreoElectronico = scanner.nextLine();

        try (Connection connection = DriverManager.getConnection(URL, USUARIO, CLAVE)) {
            String consulta = "UPDATE clientes SET correo_electronico = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(consulta);
            statement.setString(1, nuevoCorreoElectronico);
            statement.setInt(2, id);
            int filasActualizadas = statement.executeUpdate();
            if (filasActualizadas > 0) {
                System.out.println("Registro actualizado correctamente.");
            } else {
                System.out.println("No se encontró el registro.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminar() {
        System.out.print("Ingrese el ID del cliente que desea eliminar: ");
        int id = scanner.nextInt();

        try (Connection connection = DriverManager.getConnection(URL, USUARIO, CLAVE)) {
            String consulta = "DELETE FROM clientes WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(consulta);
            statement.setInt(1, id);
            int filasEliminadas = statement.executeUpdate();
            if (filasEliminadas > 0) {
                System.out.println("Registro eliminado correctamente.");
            } else {
                System.out.println("No se encontró el registro.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Principal principal = new Principal();

        int opcion;
        do {
            System.out.println("Seleccione una opción:");
            System.out.println("1. Insertar un cliente");
            System.out.println("2. Consultar clientes");
            System.out.println("3. Actualizar un cliente");
            System.out.println("4. Eliminar un cliente");
            System.out.println("5. Salir");
            System.out.print("Opción: ");
            opcion = scanner.nextInt();
            scanner.nextLine(); // Consume the remaining newline character

            switch (opcion) {
                case 1:
                    principal.insertar();
                    break;
                case 2:
                    principal.consultar();
                    break;
                case 3:
                    principal.actualizar();
                    break;
                case 4:
                    principal.eliminar();
                    break;
                case 5:
                    System.out.println("¡Hasta luego!");
                    break;
                default:
                    System.out.println("Opción inválida. Intente nuevamente.");
                    break;
            }
            System.out.println("----------------------------------------");
        } while (opcion != 5);
    }
}