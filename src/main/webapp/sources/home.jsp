<%--
  Created by IntelliJ IDEA.
  User: maria
  Date: 16.06.2017
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<link rel="stylesheet" type="text/css"
      href="<c:url value="/sources/libraries/css/csshomepage.css"/>">

<div class="row main">

    <div class="firsblock col-sm-10 col-sm-offset-1 ">
        <img src="/sources/libraries/images/hichhikincroped.jpg" alt="hitchhike" class="img-responsive img-rounded mainimage" >
        <div id="text-carousel" class="carousel slide col-xs-12 centercsshome" data-ride="carousel" >
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#text-carousel" data-slide-to="0" class="active"></li>
                <li data-target="#text-carousel" data-slide-to="1"></li>
                <li data-target="#text-carousel" data-slide-to="2"></li>
            </ol>

            <div class="col-xs-offset-2 col-xs-8 ">
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="carousel-content">
                            <div>
                                <blockquote class="centercsshome">
                                    <p >“We see in order to move. We move in order to see.” </p>
                                    <footer class="source" >William Gibson<cite title="Source Title"></cite></footer>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-content">
                            <div>
                                <blockquote class="centercsshome">
                                    <p >“Tourists don’t know where they’ve been, travelers don’t know where they’re going.”</p>
                                    <footer  class="source">Paul Theroux<cite title="Source Title"></cite></footer>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-content">
                            <div>
                                <blockquote class="centercsshome">
                                    <p>“Traveling – it leaves you speechless, then turns you into a storyteller.” </p>
                                    <footer  class="source">Ibn Battuta<cite title="Source Title"></cite></footer>
                                </blockquote>
                            </div>
                        </div>
                    </div>

                </div>
            </div>



        </div>


    </div>

    <div class="secondblock col-sm-10 col-sm-offset-1 col-xs-12  black">
        <h2 class="text-center">Share your geographical discoveries</h2>
        <br>
        <img src="/sources/libraries/images/thumbup.jpg" alt="manonplatform" class="img-responsive col-xs-12 col-sm-6 img-rounded">
        <p class="col-xs-12 col-sm-6 paragraph"  style="margin-top: 5px;">
            Accidentally or plannedly you can see some colorful places that leave a mark in your heart by its juicy and picturesque scape. You have to share your heritage with others who have not yet been able to decide where to go or have already visited all known places.</p>
    </div>

    <div class="thirdblock col-sm-10 col-sm-offset-1  col-xs-12  black ">
        <h2 class="text-center">Search new places to visit</h2>
        <br>
        <p class="col-xs-12 col-sm-6 paragraph">
            If you do not know where to go to see something amazing, you got tired of walking the same places over and over again, then you can look for places here and now. All you need is to just jump to Blog page and lelect area, where you want to go. If you have registered, you can save your toured places and assessed, after it will be available for review by other seekers.</p>
        <img src="/sources/libraries/images/manonplatform.jpg" alt="manonplatform" class="img-responsive img-rounded col-xs-12 col-sm-6">
    </div>

</div>

<%@include file="footer.jsp"%>