<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<c:url var="url" value="/jsp/layout/head.jsp">
    <c:param name="title" value="Let's Moovie"/>
</c:url>
<c:import url="${url}"/>
<body>
<link rel="stylesheet" href="<c:url value="/css/index.css"/>">
<div class="wrapper">
    <c:import url="/jsp/layout/header.jsp"/>
    <div id="content" class="row">
        <div class="small-12 columns">
            <div class="row">
                <ul class="tabs" data-tab>
                    <li class="tab-title active small-6 column"><a href="#panel1">Settimana</a></li>
                    <li class="tab-title small-6 column"><a href="#panel2">Lista completa</a></li>
                </ul>
            </div>
            <dl id="home" class="accordion" data-accordion>
                <dd class="accordion-navigation">
                    <div id="panel1" class="content active">
                        <ul class="tabs" data-tab id="daysLabel">
                            <li class="tab-title"><a href="#panelLunedì">Lunedì</a></li>
                            <li class="tab-title"><a href="#panelMartedì">Martedì</a></li>
                            <li class="tab-title"><a href="#panelMercoledì">Mercoledì</a></li>
                            <li class="tab-title"><a href="#panelGiovedì">Giovedì</a></li>
                            <li class="tab-title"><a href="#panelVenerdì">Venerdì</a></li>
                            <li class="tab-title"><a href="#panelSabato">Sabato</a></li>
                            <li class="tab-title"><a href="#panelDomenica">Domenica</a></li>
                        </ul>
                        <div class="tabs-content" id="daysTab">
                            <div class="content" id="panelLunedì">
                                <c:set scope="request" value="true" var="orario"/>
                                <c:import url="template/filmItemList.jsp"/>
                            </div>
                            <div class="content" id="panelMartedì">
                                <c:set scope="request" value="true" var="orario"/>
                                <c:import url="template/filmItemList.jsp"/>
                            </div>
                            <div class="content" id="panelMercoledì">
                                <c:set scope="request" value="true" var="orario"/>
                                <c:import url="template/filmItemList.jsp"/>
                            </div>
                            <div class="content" id="panelGiovedì">
                                <c:set scope="request" value="true" var="orario"/>
                                <c:import url="template/filmItemList.jsp"/>
                            </div>
                            <div class="content" id="panelVenerdì">
                                <c:set scope="request" value="true" var="orario"/>
                                <c:import url="template/filmItemList.jsp"/>
                            </div>
                            <div class="content" id="panelSabato">
                                <c:set scope="request" value="true" var="orario"/>
                                <c:import url="template/filmItemList.jsp"/>
                            </div>
                            <div class="content" id="panelDomenica">
                                <c:set scope="request" value="true" var="orario"/>
                                <c:import url="template/filmItemList.jsp"/>
                            </div>
                        </div>
                    </div>


                    <div id="panel2" class="content">
                        <div class="content-box section-box">
                            <c:set scope="request" value="false" var="orario"/>
                            <c:import url="template/filmItemList.jsp"/>
                        </div>
                    </div>
                </dd>
            </dl>

        </div>
    </div>
    <div class="push"></div>
</div>
<c:import url="/jsp/layout/footer.jsp"/>
<script src="<c:url value="/javascript/index.js"/>"></script>
</body>
</html>