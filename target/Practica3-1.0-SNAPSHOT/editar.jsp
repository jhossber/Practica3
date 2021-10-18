<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
            <h1 class="text-center">
                <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request">
                    Registro de
                </c:if>
                <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request">
                    Modificar
                </c:if>
                Libro
            </h1>
            <jsp:useBean id="miLibro" scope="request" class="com.emergentes.modelo.Libro"/>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <form action="Controller" method="POST">
                        <div class="form-group">
                            <label for="id">ID</label>
                            <input class="form-control" id="id" type="number" name="id" value="<jsp:getProperty name="miLibro" property="id"/>">                            
                        </div>
                        <div class="form-group">
                            <label for="titulo">Titulo</label>
                            <input class="form-control" id="titulo" type="text" name="titulo" value="<jsp:getProperty name="miLibro" property="titulo"/>">
                        </div>
                        <div class="form-group">
                            <label for="autor">Autor</label>
                            <input class="form-control" id="autor" type="text" name="autor" value="<jsp:getProperty name="miLibro" property="autor"/>">
                        </div>
                        <div class="form-group">
                            <label for="resumen">Resumen</label>
                            <input class="form-control" id="resumen" type="text" name="resumen" value="<jsp:getProperty name="miLibro" property="resumen"/>">
                        </div>
                        <div class="form-group">
                            <label for="pre">Medio</label>
                            <div class="form-check">
                                <input class="form-check-input" id="m1" type="radio" name="medio" value="1"
                                       ${miLibro.medio==1?'checked':''}>
                                <label class="form-check-label" for="m1">
                                    Fisico
                                </label>
                            </div>                                                        
                            <div class="form-check">
                                <input class="form-check-input" id="m2" type="radio" name="medio" value="2"
                                       ${miLibro.medio==2?'checked':''}>
                                <label class="form-check-label" for="m2">
                                    Magnetico
                                </label>
                            </div>
                            <div>
                                <input type="hidden" name="opg" value="${requestScope.op}"/>
                                <input type="hidden" name="op" value="grabar"/>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Enviar</button>               
                    </form>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    </body>
</html>
