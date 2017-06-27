<%--
  Created by IntelliJ IDEA.
  User: maria
  Date: 16.06.2017
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>

<link rel="stylesheet" type="text/css"
      href="<c:url value="/sources/libraries/css/LoginAdmin.css"/>">
<div class="row main">

<%--    <div class="mapa">
        <iframe src="" width="100%" height="450" frameborder="0" style="border:0" ></iframe>
    </div>

    <hr>--%>
    <div class="col-xs-10 col-xs-offset-1">
        <sec:authorize access="hasRole('ROLE_USER')">
            <div class="addpostbutton">

                <button id="addpostbutton" class="btn btn-lg btn-default" type="button" value="Add Post" name="addpost" onclick="document.getElementById('addPostForm').style.display='block'">Add post</button>
            </div>
        </sec:authorize>
        <%--
        <div class="btn-group" >
            <button type="button" class="btn btn-default  btn-lg dropdown-toggle sortpost" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                Sorted by: <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="#">date (from old)</a></li>
                <li><a href="#">date (from new)</a></li>
            </ul>
        </div>
--%>
    </div>


    <div class="col-xs-10 col-xs-offset-1 postplace">
        <div class="row">


            <c:forEach items="${posts}" var="post">
                <div class="col-md-6  center" id="post">
                    <div class="thumbnail">
                        <div class="photoofplace">
                            <c:set var = "oneph" scope = "session" value = "${0*0}"/>

                            <c:forEach items="${post.images}" var="img">
                                <c:if test = "${oneph == 0}">
                                    <img src="${img.url}" alt="" class="img-responsive center">
                                    <c:set var = "oneph" scope = "session" value = "${1*1}"/>
                                </c:if>
                            </c:forEach>


                        </div>
                        <div class="caption">
                            <div class="description">${post.description}</div>
                            <div class="linkondetail text-center"><a href="/post/${post.id}"> Show more  </a> </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<div class="container modal col-xs-12" id="addPostForm">
    <form method="post"  class="center modal-content">
        <span onclick="document.getElementById('addPostForm').style.display='none'" class="close" title="Close Modal">&times;</span>
        <div class="form-group ">
            <label for="placeName">Name of place</label>
            <input type="text" class="form-control" id="placeName" placeholder="name of place">
        </div>
        <div class="form-group ">
            <iframe src="" width="100%" height="250" frameborder="0" style="border:0" ></iframe>
        </div>
        <div class="form-group ">
            <label for="description">Description</label>
            <textarea class="form-control description" id="description" rows="3" placeholder="description"></textarea>
        </div>
        <%--
        <div class="form-group" id="ADDURL">
            <%! int url; %>
            <%for ( url = 1; url <= 3; url++){ %>
            <label class="labeimage" for="<%= url %>">image: </label>
            <input type="text" class="form-control" id="<%= url %>" placeholder="image url <%= url %>">
            <%}%>
            <button class="btn btn-default moreurlbnt" type="button" id="addphotoButton">Add one more url</button>
            <div id="moreurl">
                <%for ( url = 4; url <= 10 ; url++){ %>
                <label class="labeimage" for="<%= url %>">image: </label>
                <input type="text" class="form-control"  id="<%= url %>" placeholder="image url <%= url %>">
                <%}%>
            </div>
        </div>
        --%>
        <button id="addpostbuttonsubmit" class="btn btn-lg btn-default" type="button" value="${userId}" name="addpostsubmit">Add post</button>
    </form>
</div>


<%@include file="footer.jsp"%>
<%--
=======
<html>
    <head>
        <link rel="stylesheet" type="text/css"
              href="<c:url value="/sources/libraries/css/map.css"/>">
        <link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet">
        <meta charset="utf-8">
    </head>
    <body>
    <%--Only map with only user's markers--%>
<%--
    <div id="map"></div>

    <script>
    </script>



    <%--Here should be user's posts--%>




<%--
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7Zjtd4l4r2a8LbF8mxOga621e5dbcVt8&v=3&callback=initMap"></script>

    </body>
</html>

<%@include file="footer.jsp"%>
--%>
