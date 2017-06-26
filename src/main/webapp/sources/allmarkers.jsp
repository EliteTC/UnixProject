<%--
  Created by IntelliJ IDEA.
  User: Вадим
  Date: 24.06.2017
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>



    <link rel="stylesheet" type="text/css"
          href="<c:url value="/sources/libraries/css/map.css"/>">

    <link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet">
    <meta charset="utf-8">

<div id="map">

    <script>
        var map;
        var markers = [];

        function initMap() {

            map = new google.maps.Map(document.getElementById('map'), {
                //center: {lat: 50.431782, lng: 30.516382},
                center: {lat: 50.47207, lng: 30.513942},
                zoom: 7
            });

            var contentString = '<div id="content">'+
                '<div id="getNotice"></div>'+
                '<img src="">'+
                '<br>Post: '+'<div id="articleTitle"></div>'+
                '</div>';

            // TODO: create a single infowindow, with your own content.
            // It must appear on the marker
            var infowindow = new google.maps.InfoWindow({
                content: contentString
            });

            var bounds = new google.maps.LatLngBounds();

            locations = [
                {title: 'Головний корпус КМА', location: {lat: 50.464370, lng: 30.519123}},
                {title: 'Сад Каменів', location: {lat: 50.490956, lng: 30.528926}},
                {title: 'Місце для читання. Botan', location: {lat: 50.461049, lng: 30.510160}},
                {title: 'Стадіон Лобановського', location: {lat: 50.450252, lng: 30.535111}}
            ];

            var largeInfowindow = new google.maps.InfoWindow();

            //loop for creating and initialization markers array
            for(var i = 0; i < locations.length; i++){
                //get positions from locations array
                var position = locations[i].location;
                var title = locations[i].title;

                var marker = new google.maps.Marker({
                    map: map,
                    position: position,
                    title: title,
                    animation: google.maps.Animation.DROP,
                    id: 1
                });
                //push our marker to our array
                markers.push(marker);
                //Extend the boudaries of the map for each marker
                bounds.extend(marker.position);
                //create an onclick event to open an infowindow at each marker
                marker.addListener('click', function(){
                    populateInfoWindow(this, largeInfowindow);
                });
            }
            map.fitBounds(bounds);

            //funciton for...
            function populateInfoWindow(marker, infowindow) {
                if(infowindow.marker != marker){
                    infowindow.marker = marker;
                    infowindow.setContent('<div>' + marker.title + '</div>');
                    infowindow.open(map, marker);
                    infowindow.setPosition(marker);
                    //make sure that marker property cleared if the window is closed
                    infowindow.addListener('closeclick', function(){
                        infowindow.setMarker(null);
                    });
                }
            }
        }
    </script>

    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7Zjtd4l4r2a8LbF8mxOga621e5dbcVt8&v=3&callback=initMap"></script>

</div>

<%@include file="footer.jsp"%>