function consultarClientes() {
    $.ajax({
        url: "consultar.jsp", // Reemplazar por la URL correcta o la ruta del archivo JSP
        type: "GET",
        dataType: "html", // Especificar el tipo de datos esperado en la respuesta
        success: function(response) {
            $("#resultado").html(response);
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
}

function insertar() {
$.ajax({
    url: "insertar.jsp",
    type: "POST",
    success: function(response) {
        $("#resultado").html(response);
    },
    error: function(xhr, status, error) {
        console.error(error);
    }
});
}

function eliminar() {
$.ajax({
    url: "eliminar.jsp",
    type: "POST",
    success: function(response) {
        $("#resultado").html(response);
    },
    error: function(xhr, status, error) {
        console.error(error);
    }
});
}

function modificar() {
$.ajax({
    url: "modificar.jsp",
    type: "POST",
    success: function(response) {
        $("#resultado").html(response);
    },
    error: function(xhr, status, error) {
        console.error(error);
    }
});
}