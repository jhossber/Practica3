<%@page import="com.emergentes.modelo.Libro"%>
<%@page import="com.emergentes.modelo.GestorLibros"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    if(session.getAttribute("agenda") == null){
        GestorLibros objeto1 = new GestorLibros();
        
        objeto1.insertarLibro(new Libro(1, "Fisica I", "Lucio Nina", "Introduccion a la Fisica", 1));
        objeto1.insertarLibro(new Libro(2, "Programacion I", "Luis Maldonado", "La Programacion gira en base", 2));
        objeto1.insertarLibro(new Libro(3, "Calculo II", "Gabi Choque", "Introduccion a Calculo", 1));
        
        session.setAttribute("agenda", objeto1);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <title>Practica 3</title>
    </head>
    <body>        
        <div class="container">
            <h1 class="text-center">Lista de Libros</h1>
            <div class="row">
                <div class="col float-right">
                    <a class="btn btn-primary float-right" href="Controller?op=nuevo">Nuevo</a>
                </div>                
            </div> <br>

            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Titulo</th>
                                <th>Autor</th>
                                <th>Resumen</th>
                                <th>Medio</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.titulo}</td>
                            <td>${item.autor}</td>
                            <td>${item.resumen}</td>
                            <td>${item.medio}</td>
                            <td><a class="btn btn-warning btn-sm" href="Controller?op=modificar&id=${item.id}">Modificar</a></td>
                            <td><a class="btn btn-danger btn-sm" href="Controller?op=eliminar&id=${item.id}"
                                   onclick="return confirm('Esta seguro que desea Eliminar el Registro ?');">Eliminar</a></td>
                        </tr>
                        </c:forEach>                                                                  
                    </table> 
                </div>
            </div>

        </div>        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
        
        
    </body>
</html>
