
package com.emergentes;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession ses = request.getSession();
        ArrayList<Producto> lista = (ArrayList<Producto>)ses.getAttribute("lista");
            
        Producto objprod = new Producto();
    
        String op = request.getParameter("op");
        
        if(op.equals("editar")){
            int id = Integer.parseInt(request.getParameter("id"));
            //Averiguar la posicion de elemento en la lista
            int pos = buscarPorIndice(request, id);
            //obtener el objeto
            objprod = lista.get(pos);
            request.setAttribute("miobjpro", objprod);
            request.getRequestDispatcher("Formulario.jsp").forward(request, response);
        }        
        if(op.equals("eliminar")){
            int pos = -1;
            int buscado = 0;
            int id = Integer.parseInt(request.getParameter("id"));
            
            for(Producto p: lista){
                pos++;
                if(p.getId() == id){
                    buscado = pos; 
                }
            }
            lista.remove(buscado);
            response.sendRedirect("index.jsp");
        }
               
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {
       
        int id = Integer.parseInt( request.getParameter("id"));
        String tarea = request.getParameter("tarea");
  
        Producto prod = new Producto();
        
        prod.setId(id);
        prod.setTarea(tarea);
       
        HttpSession ses = request.getSession();
        
        ArrayList<Producto> lista = (ArrayList<Producto>)ses.getAttribute("lista");
        
        lista.add(prod);
        
        response.sendRedirect("index.jsp");
    }
        public int buscarPorIndice(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        ArrayList<Producto> lista = (ArrayList<Producto>) ses.getAttribute("lista");
        int pos = -1;
        if(lista!= null){
            for(Producto p : lista){
                ++pos;
                if(p.getId() == id){
                    break;
                }

            }
        }
        return pos;
        }
}