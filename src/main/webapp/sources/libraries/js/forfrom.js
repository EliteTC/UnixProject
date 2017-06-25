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
        //    location.reload();
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

$(".editpostbuttonsubmit").click(function(event){
    $.ajax({
        url: "/edit-post",
        type: "POST",
        data: {
            "id":this.id,
            "title": $("#placeNameEdit").val(),
            "description": $("#descriptionEdit").val(),
            "author_id": 1
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