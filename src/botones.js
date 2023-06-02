function consultarClientes() {
    $.ajax({
        url: "consultar.jsp",
        type: "GET",
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