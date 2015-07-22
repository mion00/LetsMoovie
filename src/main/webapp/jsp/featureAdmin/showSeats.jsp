<%--Posti venduti--%>
<%--seleziona il giorno, poi seleziona lo spettacolo (film, sala,ora in un' unica stringa), poi mostro la mappa--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<c:url var="url" value="/jsp/layout/head.jsp">
    <c:param name="title" value="Mostra posti venduti"/>
</c:url>
<c:import url="${url}"/>
<body>
<div class="wrapper">
    <c:import url="/jsp/layout/header.jsp"/>
    <div id="content" class="row">
        <div class="row">
            <div class="medium-4 columns">
                <h4>Selezionare il giorno</h4>
            </div>
            <div class="medium-4 columns end">
                <select>
                    <option><span id="Date"></span></option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="medium-4 columns">
                <h4>Selezionare lo spettacolo</h4>
            </div>
            <div class="medium-4 columns end">
                <select>
                    <option><span id="Film"></span></option>
                </select>
            </div>
        </div>
        <%--mostro la mappa 3d con i pulsanti reset, blocca--%>
        <div class="row">
            <div class="small-12 columns"><h4>Posti prenotati:</h4></div>
        </div>
    </div>
    <%--bottoni--%>
    <div class="row">
        <div class="small-6 columns text-center">
            Blocca visuale
            <div class="switch">
                <input id="bloccaVisuale" type="checkbox">
                <label for="bloccaVisuale"></label>
            </div>
        </div>
        <div class="small-6 columns text-center">
            <a href="#" class="button small radius" id="resettaVisuale">Resetta visuale</a>
        </div>
    </div>
    <%--mappa--%>
    <div class="row">
        <div class="small-12 columns text-center">
            <div id="roomMap">

            </div>
        </div>
    </div>


    <div class="push"></div>
</div>
<c:import url="/jsp/layout/footer.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r71/three.min.js"></script>
<script src="http://threejs.org/examples/js/controls/OrbitControls.js"></script>
<script src="http://threejs.org/examples/js/loaders/OBJLoader.js"></script>
<script src="<c:url value="/javascript/3DCinemaView.js"/>"></script>
</body>
</html>
