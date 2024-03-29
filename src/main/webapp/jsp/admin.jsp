<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<c:url var="url" value="/jsp/layout/head.jsp">
    <c:param name="title" value="Area Amministratore"/>
</c:url>
<c:import url="${url}"/>
<body>
<div class="wrapper">
    <c:import url="/jsp/layout/header.jsp"/>
    <div id="content" class="row">
        <h3>Funzionalità amministratore</h3>

        <ul class="accordion" data-accordion>
            <li class="accordion-navigation">
                <a href="#panel1a">Gestione sale</a>

                <div id="panel1a" class="content active">
                    <div class="panel radius">

                        <div class="row">
                            <div class="medium-4 columns">
                                <a href="/admin/showSeats" class="button expand radius">Posti venduti</a>
                            </div>
                            <div class="medium-8 columns">
                                <p>Consente di vedere la lista dei posti venduti
                                    per ciascuna programmazione.</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="medium-4 columns">
                                <a href="/admin/reservedSeats" class="button expand radius">Posti più
                                    prenotati</a>
                            </div>
                            <div class="medium-8 columns">
                                <p>Consente di vedere la mappa dei posti più prenotati.</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="medium-4 columns">
                                <a href="/admin/deleteReservation" class="button expand radius">
                                    Cancella prenotazione</a>
                            </div>
                            <div class="medium-8 columns">
                                <p>Consente di cancellare una prenotazione
                                    per una proiezione non ancora iniziata.</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="medium-4 columns">
                                <a href="/admin/updateStatus" class="button expand radius">
                                    Modifica posti</a>
                            </div>
                            <div class="medium-8 columns">
                                <p>Consente di modificare lo stato di un posto.</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="medium-4 columns">
                                <a href="<c:url value="/admin/editShowDuration/"/>" class="button expand radius">
                                    Modifica programmazione</a>
                            </div>
                            <div class="medium-8 columns">
                                <p>Cambia la durata degli spettacoli</p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li class="accordion-navigation">
                <a href="#panel2a">Statistiche</a>

                <div id="panel2a" class="content">
                    <div class="panel radius">

                        <div class="row">
                            <div class="medium-4 columns">
                                <a href="/admin/filmCashing" class="button expand radius">
                                    Incassi per film</a>
                            </div>
                            <div class="medium-8 columns">
                                <p>Consente di vedere la lista degli incassi
                                    dei film.</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="medium-4 columns">
                                <a href="/admin/bestCustomer" class="button expand radius">
                                    Clienti top</a>
                            </div>
                            <div class="medium-8 columns">
                                <p>Consente di vedere la lista dei clienti
                                    che hanno comprato più biglietti.</p>
                            </div>
                        </div>


                    </div>
                </div>
            </li>
        </ul>
    </div>
    <div class="push"></div>
</div>
<c:import url="/jsp/layout/footer.jsp"/>

</body>
</html>