/*
 // add modal
 $(function(){
 $("#includedContent").load("navmode.html");
 });
 */



// Get the modal
var modalLog = document.getElementById('loginForm');
var modalReg = document.getElementById('registrationForm');
var modalAddPost = document.getElementById('addPostForm');

var carusel = document.getElementById('text-carousel');


// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modalLog) {
        modalLog.style.display = "none";
        carusel.style.display = "block";
    }
    if (event.target == modalAddPost) {
        modalAddPost.style.display = "none";
    }
    if (event.target == modalReg) {
        modalReg.style.display = "none";
        carusel.style.display = "block";
    }
}

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        document.getElementById("myBtn").style.display = "block";
    } else {
        document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0; // For Chrome, Safari and Opera
    document.documentElement.scrollTop = 0; // For IE and Firefox
}

function resize() {
    if ($(window).width() < 514) {
        $('.main').css("padding","20px");

        // for buttons on blog page
        $("#addpostbutton").removeClass("btn-lg");
        $("#addpostbutton").addClass("btn-sm");
        $('.sortpost').removeClass("btn-lg");
        $(".sortpost").addClass("btn-sm");
    }
    else { $('.main').css("padding","10px");

        // for buttons on blog page
        $("#addpostbutton").removeClass("btn-sm");
        $("#addpostbutton").addClass("btn-lg");
        $('.sortpost').removeClass("btn-sm");
        $(".sortpost").addClass("btn-lg");

    }
}

$(document).ready( function() {
    $(window).resize(resize);
    resize();
    //for post form
    $("#addphotoButton").click(function(){
        $("#moreurl").css("display","block");
    });
    $("#addpostbutton").click(function(){
        $("#moreurl").css("display","none");
    });
    /*tohomepage*/
    $("#llinkoncreae").click(function(){
        $("#loginForm").css("display","none");
    });

    /* for text in div */
    $("div.description").text(function(index, currentText) {
        return currentText.substr(0, 200) + "...";
    });


});

