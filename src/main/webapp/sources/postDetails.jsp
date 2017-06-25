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
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d325515.6816494169!2d30.252504313194645!3d50.40213675084257!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40d4cf4ee15a4505%3A0x764931d2170146fe!2z0JrQuNGX0LI!5e0!3m2!1suk!2sua!4v1495878890403" width="100%" height="450" frameborder="0" style="border:0" ></iframe>
    </div> <hr>


    <div class="col-sm-10 col-sm-offset-1 col-xs-12 ">  <span class="glyphicon glyphicon-remove removepost" id="${post.id}" title="Remove post"> </span>
        <span class="glyphicon glyphicon-pencil editpost"  title="Edit post" onclick="document.getElementById('editPostForm').style.display='block'"> </span></div>

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
                <c:forEach items="${post.images}" var="img">
        <div class="item active">
            <img src="${img.url}" alt="" class="img-responsive   img-rounded">
        </div>
                </c:forEach>
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
            <input type="text" class="form-control" id="placeNameEdit" placeholder="name of place">
        </div>
        <div class="form-group ">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d325515.6816494169!2d30.252504313194645!3d50.40213675084257!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40d4cf4ee15a4505%3A0x764931d2170146fe!2z0JrQuNGX0LI!5e0!3m2!1suk!2sua!4v1495878890403" width="100%" height="250" frameborder="0" style="border:0" ></iframe>
        </div>
        <div class="form-group ">
            <label for="descriptionEdit">Description</label>
            <textarea class="form-control description" id="descriptionEdit" rows="3" placeholder="description"></textarea>
        </div>
        <div class="form-group" id="ADDURL">
            <label class="labeimage" for="urlimage">image: </label>
            <input type="text" class="form-control" id="urlimage" placeholder="image url">
            <label class="labeimage" for="urlimage">image: </label>
            <input type="text" class="form-control" id="urlimage" placeholder="image url">
            <label class="labeimage" for="urlimage">image: </label>
            <input type="text" class="form-control" id="urlimage" placeholder="image url">
            <button class="btn btn-default moreurlbnt" type="button" id="addphotoButton">Add one more url</button>
            <div id="moreurl">
                <label class="labeimage" for="urlimage">image: </label>
                <input type="text" class="form-control" id="urlimage" placeholder="image url">
                <label class="labeimage" for="urlimage">image: </label>
                <input type="text" class="form-control" id="urlimage" placeholder="image url">
                <label class="labeimage" for="urlimage">image: </label>
                <input type="text" class="form-control" id="urlimage" placeholder="image url">
                <label class="labeimage" for="urlimage">image: </label>
                <input type="text" class="form-control" id="urlimage" placeholder="image url">
                <label class="labeimage" for="urlimage">image: </label>
                <input type="text" class="form-control" id="urlimage" placeholder="image url">
                <label class="labeimage" for="urlimage">image: </label>
                <input type="text" class="form-control" id="urlimage" placeholder="image url">
            </div>
        </div>
        <button id="${post.id}" class="btn btn-lg btn-default editpostbuttonsubmit" type="button" value="Edit Post" name="editpostsubmit">Edit post</button>
    </form>
</div>
    <%@include file="footer.jsp"%>
