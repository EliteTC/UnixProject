<%--
  Created by IntelliJ IDEA.
  User: maria
  Date: 16.06.2017
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css"
              href="<c:url value="/sources/libraries/css/map.css"/>">
        <link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet">
        <meta charset="utf-8">
    </head>
    <body>
    <%--Only map with only user's markers--%>
    <div id="map"></div>

    <script>
    </script>



    <%--Here should be user's posts--%>





    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7Zjtd4l4r2a8LbF8mxOga621e5dbcVt8&v=3&callback=initMap"></script>

    </body>
</html>

<%@include file="footer.jsp"%>
