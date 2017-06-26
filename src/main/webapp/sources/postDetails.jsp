<%--
  Created by IntelliJ IDEA.
  User: maria
  Date: 18.06.2017
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<link rel="stylesheet" type="text/css"
      href="<c:url value="/sources/libraries/css/postDetails.css"/>">
<link rel="stylesheet" type="text/css"
      href="<c:url value="/sources/libraries/css/LoginAdmin.css"/>">
<div class="row main">
    <div class="mapa">
        <iframe src="" width="100%" height="450" frameborder="0" style="border:0" ></iframe>
    </div> <hr>

<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
    <c:if test = "${post.author}===${userId}">
    <div class="col-sm-10 col-sm-offset-1 col-xs-12 ">  <span class="glyphicon glyphicon-remove removepost" id="${post.id}" title="Remove post"> </span>
        <span class="glyphicon glyphicon-pencil editpost"  title="Edit post" onclick="document.getElementById('editPostForm').style.display='block'"> </span></div>
   </c:if>
</sec:authorize>

    <div class="secondblock col-sm-10 col-sm-offset-1 col-xs-12 ">

        <h4 class="text-center"><b>${post.title}</b></h4>
        <p>${post.description}</p>

        <hr><h4 class="text-center"><b>GALLERY</b></h4>

        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <c:set var = "act" scope = "session" value = "${0*0}"/>

                <c:forEach items="${post.images}" var="img">
                    <c:if test = "${act == 1}">
                        <div class="item">
                            <img src="${img.url}" alt="" class="img-responsive img-rounded">
                        </div>
                    </c:if>

                    <c:if test = "${act == 0}">
                        <div class="item active">
                            <img src="${img.url}" alt="" class="img-responsive img-rounded">
                        </div>
                        <c:set var = "act" scope = "session" value = "${1*1}"/>
                    </c:if>

                </c:forEach>
            </div>
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" style="color:black;"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" style="color:black;"></span>
                <span class="sr-only">Next</span>
            </a>

        </div>

    </div>

</div>
    </div>

<div class="container modal col-xs-12" id="editPostForm">
    <form method="post" action="/" class="center modal-content">
        <span onclick="document.getElementById('editPostForm').style.display='none'" class="close" title="Close Modal">&times;</span>
        <div class="form-group ">
            <label for="placeNameEdit">Name of place</label>
            <input type="text" class="form-control" id="placeNameEdit" placeholder="name of place" value="${post.title}">
        </div>
        <div class="form-group ">
            <iframe src="" width="100%" height="250" frameborder="0" style="border:0" ></iframe>
        </div>
        <div class="form-group ">
            <label for="descriptionEdit">Description</label>
            <textarea class="form-control description" id="descriptionEdit" rows="3" placeholder="description">${post.description}</textarea>
        </div>
        <div class="form-group" id="ADDURL">
            <%! int url; %>
            <%for ( url = 11; url <= 13; url++){ %>
            <label class="labeimage" for="<%= url %>">image: </label>
            <input type="text" class="form-control" id="<%= url %>" placeholder="image url <%= url %>">
            <%}%>
            <button class="btn btn-default moreurlbnt" type="button" id="addphotoButton">Add one more url</button>
            <div id="moreurl">
                <%for ( url = 14; url <= 20 ; url++){ %>
                <label class="labeimage" for="<%= url %>">image: </label>
                <input type="text" class="form-control"  id="<%= url %>" placeholder="image url <%= url %>">
                <%}%>
            </div>
        </div>
        <button value="${userId}" id="editpostbuttonsubmit" class="btn btn-lg btn-default" type="button" name="editpostsubmit">Edit post</button>
    </form>
</div>
    <%@include file="footer.jsp"%>
