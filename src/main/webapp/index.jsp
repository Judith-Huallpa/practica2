<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Producto"%>
<%
    if (session.getAttribute("lista") == null) {
        ArrayList<Producto> listaAux = new ArrayList<Producto>();
        session.setAttribute("lista", listaAux);

    }

    ArrayList<Producto> lista = (ArrayList<Producto>) session.getAttribute("lista");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TAREAS</title>
    </head>
    <body>
        <center><h1>GESTOR DE TAREAS</h1></center>
        <center><h2>Nombre: Huallpa Mayta Judith Esther</h2></center> 

    <a href="Formulario.jsp">Nuevo</a>

    <table border="1" align="center">
        <tr>
            <th>Id</th>
            <th>Tarea</th>
            <th>Completado</th>
            <th>Opciones</th>
        </tr>
        
            <%                if (lista != null) {
                    for (Producto p : lista) {
            %>
        <tr>
            <td><%= p.getId()%></td>
            <td><%= p.getTarea()%></td>
            <td><input type="checkbox" name=""/></td>
            <td><a href="MainServlet?op=editar&id=<%= p.getId()%>">editar</a></td>
            <td><a href="MainServlet?op=eliminar&id=<%= p.getId()%>">eliminar</a></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
