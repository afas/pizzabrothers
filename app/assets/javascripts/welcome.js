$(document).ready(function () {
    $(".order-button").on("click", function () {
        console.log("123");
        $(this).toggleClass("show-big-price");
    });

//    $("#request-type-options li").on("click", function () {
//        var selected = $(this).html();
//        if ($(this).attr("parent") != '') {
//            selected += " (" + $("#request-type-option-" + $(this).attr("parent")).html() + ")";
//        }
//
//        $("#request-type .link span").html(selected);
//        $("#request-type .request-type-options").toggleClass("visible");
//    });

});