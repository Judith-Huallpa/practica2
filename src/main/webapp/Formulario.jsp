<%@page import="com.emergentes.Producto"%>
<%
    Producto reg = (Producto) request.getAttribute("miobjpro");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TAREAS</title>
    </head>
    <body>
        <h1>Nueva tarea</h1>
        <form action="MainServlet" method="POST">
        <table>
            <tr>
                <td>Id: </td>
                <td><input type="text" name="id" value="<%= reg.getId() %>"> </td>
            </tr>
            <tr>
                <td>Tarea: </td>
                <td><input type="text" name="tarea" value="<%= reg.getTarea() %>"> </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Enviar"></td>
            </tr>
        </table>
    </form>
    </body>
</html>
