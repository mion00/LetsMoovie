<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<c:url var="url" value="/jsp/layout/head.jsp">
    <c:param name="title" value="Scelta posto"/>
</c:url>
<c:import url="${url}"/>

<body>
<link rel="stylesheet" href="<c:url value="/css/seats.css"/>">
<div class="wrapper">
    <c:import url="/jsp/layout/header.jsp"/>
    <div id="content" class="row">

        <div data-magellan-expedition="fixed">
            <dl class="sub-nav">
                <dd data-magellan-arrival="sceltaPosti"><a href="#sceltaPosti">Scegli i posti</a></dd>
                <dd data-magellan-arrival="riepilogo"><a href="#riepilogo">Riepilogo</a></dd>
            </dl>
        </div>

        <div class="row collapse" data-magellan-destination="sceltaPosti">
            <a name="sceltaPosti"></a>

            <div class="small-6 columns text-center">
                Blocca visuale
                <div class="switch">
                    <input id="bloccaVisuale" type="checkbox">
                    <label for="bloccaVisuale"></label>
                </div>
            </div>
            <div class="small-6 columns text-center">
                <a href="#" class="button radius" id="resettaVisuale">Resetta visuale</a>
            </div>
        </div>

        <div class="row collapse" data-magellan-destination="sceltaPosti">
            <a name="sceltaPosti"></a>

            <div class="small-12 columns text-center">
                <div id="roomMap">

                </div>
            </div>
        </div>

        <form id="biglietti" class="hide" action="<c:url value="/api/reservation/"/>" method="post">
            <input type="hidden" name="show" id="show">
            <div id="centralContent" class="row collapse">
                <h5>Seleziona per ciascun posto la tipologia del biglietto:</h5>

                <div class="small-12 columns" data-magellan-destination="riepilogo" id="riepilogoBiglietti">
                    <a name="riepilogo"></a>
                    <c:import url="/jsp/template/postoItemList.jsp"/>
                </div>
            </div>
            <div class="row collapse">
                <div class="small-12 columns">
                    <h4 class="large-text-right medium-text-center">Totale: <span id="total"></span></h4>
                </div>
                <div class="small-12 columns text-center">
                    <button class="radius">Procedi al pagamento</button>
                </div>
            </div>
        </form>

    </div>
    <div class="push"></div>
</div>
<c:import url="/jsp/layout/footer.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r71/three.min.js"></script>
<script src="http://threejs.org/examples/js/controls/OrbitControls.js"></script>
<script src="http://threejs.org/examples/js/loaders/OBJLoader.js"></script>
<script src="<c:url value="/javascript/3DCinemaView.js"/>"></script>
<script src="<c:url value="/javascript/seats.js"/>"></script>

</body>
</html>