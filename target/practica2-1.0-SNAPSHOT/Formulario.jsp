<%@page import="emergentes.producto"%>
<%
    producto reg = (producto) request.getAttribute("miobjpro");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TAREAS</title>
    </head>
    <body>
        <h1>Registro de Tareas </h1>
        <form action="MainServlet" method="post">
        <table>
            <tr>
                <td>Id: </td>
                <td><input type="text" name="id" value="" size="2" ></td>
            </tr>
            <tr>
                <td>Tarea: </td>
                <td><input type="text" name="tareas" value=""> </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Enviar"></td>
            </tr>
        </table>
        </form>              
    </body>
</html>
