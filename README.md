# Portal de Gestión de Clientes para Asesoría Financiera

Este portal web brinda una solución integral para la gestión de clientes en una empresa de asesoría financiera especializada en el apoyo a emprendedores. Ofrece las siguientes funcionalidades esenciales:

## 1. Registro de Clientes

El portal permite el ingreso de nuevos clientes, solicitando información relevante como:

- Nombres y apellidos del cliente
- Edad del cliente
- Correo electrónico del cliente
- Tipo de emprendimiento del cliente
- Fecha de cumpleaños del cliente

Los datos ingresados son enviados al servidor para su procesamiento y posterior almacenamiento en una base de datos.

## 2. Consulta de Clientes

El portal ofrece la posibilidad de consultar la información de todos los clientes registrados. Al acceder a esta funcionalidad, se muestra una lista completa de los clientes, junto con los siguientes detalles:

- Identificación del cliente
- Nombres y apellidos del cliente
- Edad del cliente
- Correo electrónico del cliente
- Tipo de emprendimiento del cliente
- Fecha de cumpleaños del cliente

Esta funcionalidad proporciona una visión general de todos los clientes registrados y sus respectivos detalles.

## 3. Actualización de Información de Clientes

El portal permite actualizar la información de un cliente existente. Para ello, se solicita al usuario que ingrese el ID del cliente y el nuevo correo electrónico. Al enviar la solicitud de actualización, el sistema verifica la existencia del cliente y realiza la actualización correspondiente en la base de datos.

Esta funcionalidad resulta útil cuando se requiere actualizar la información de contacto de un cliente.

## 4. Eliminación de Clientes

El portal permite la eliminación de un cliente existente en la base de datos. El usuario debe ingresar el ID del cliente que desea eliminar. Al enviar la solicitud, el sistema verifica la existencia del cliente y procede con la eliminación en la base de datos.

Esta funcionalidad resulta útil cuando se desea eliminar los registros de un cliente que ya no es relevante o ha dejado de utilizar los servicios de la empresa.

## Requisitos del Sistema

El portal web ha sido desarrollado utilizando tecnologías estándar para la web. Para su funcionamiento, se requiere:

- Un servidor web compatible con JSP (Java Server Pages)
- Un servidor de base de datos MySQL
- El controlador JDBC de MySQL (`mysql-connector-java`) en el classpath del servidor web

El portal web ha sido diseñado para brindar una interfaz amigable y eficiente gestión de los clientes en el ámbito de asesoría financiera.