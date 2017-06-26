/**
 * Created by maria on 21.06.2017.
 */

// send data to DB

$("#addpostbuttonsubmit").click(function () {
    console.log("In js");
    console.log($("#addpostbuttonsubmit").val());
    $.ajax({
        url: "/add-post",
        type: "POST",
        data: {
            "title": $("#placeName").val(),
            "description": $("#description").val(),
            "author_id": $("#addpostbuttonsubmit").val()
        },
        success: function (data) {
            console.log(data);
            $('#addPostForm').fadeOut();
            location.reload();
        },
        error: function (textStatus) {
            console.log(textStatus);
        }
    });
});

$("#adduser").click(function () {
    console.log("In js");
    console.log($("#adduser").val());
    $.ajax({
        url: "/add-user",
        type: "POST",
        data: {
            "username": $("#usernameR").val(),
            "login": $("#login").val(),
            "password": $("#passwordR").val()
        },
        success: function (data) {
            console.log(data);
            $('#registrationForm').fadeOut();
            window.location.replace("/");
        },
        error: function (textStatus) {
            console.log(textStatus);
        }
    });
});

$(".removepost").click(function(event){
    $.ajax({
        url: "/delete-post",
        type: "POST",
        data:{"id":this.id},
        success: function (data) {
            console.log(data);
            console.log("Post deleted successfully");
            window.location.replace("/");
        },
        error: function(errorText){
            console.log(errorText);
            alert("Error deleting post");
        }
    });
});

$("#editpostbuttonsubmit").click(function(event){
    console.log( "DDDDDDDDDDDD" + $("#11").val());
    $.ajax({
        url: "/edit-post",
        type: "POST",
        data: {
            "id":$("#editpostbuttonsubmit").val(),
            "title": $("#placeNameEdit").val(),
            "description": $("#descriptionEdit").val(),
            "url":$("#11").val(),
            "url2":$("#12").val(),
            "url3":$("#13").val(),
            "url4":$("#14").val(),
            "url5":$("#15").val(),
            "url6":$("#16").val(),
            "url7":$("#17").val(),
            "url8":$("#18").val(),
            "url9":$("#19").val(),
            "url10":$("#20").val()
        },
        success: function (data) {
            console.log(data);
            $('#editPostForm').fadeOut();
               location.reload();
        },
        error: function (textStatus) {
            console.log(textStatus);
        }
    });
});