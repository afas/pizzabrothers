$(document).ready(function () {

//    Pizza builder
    $(".ingridient-from").click(function () {
        id = $(this).attr("id") + "_to";
        $("#" + id).removeClass("invisible");
        $("#product_description").val($("#product_description").val() + ", " + $(this).attr("alt") + " x 1");
        $("#total-price").html(parseInt($("#total-price").html()) + parseInt($(this).attr("price")));
        $("#product_price").val($("#total-price").html());
    });

    $(".ingridient-to").click(function () {
        $(this).addClass("invisible");
        $("#product_description").val($("#product_description").val().replace(", " + $(this).attr("alt") + " x 1", ""));
        $("#total-price").html(parseInt($("#total-price").html()) - parseInt($(this).attr("price")));
        $("#product_price").val($("#total-price").html());
    });

    $("#product-size .link").on("click", function () {
        $("#product-size .product-sizes").toggleClass("visible");
    });

    $("#product-sizes li").click(function () {
        $("#product_price_big").val($(this).attr("code"));
        $("#total-price").html($(this).attr("price"));
        $("#product_price").val($("#total-price").html());
        $("#product-size .link span").html($(this).html());
        $("#product-size .product-sizes").toggleClass("visible");
        $(".ingridient-to").addClass("invisible");
    });

    $("#sauce .link").on("click", function () {
        $("#sauce .sauces").toggleClass("visible");
    });

    $("#sauce li").click(function () {
        $("#product_description").val("Соус " + $(this).html());
        $("#sauce .link span").html($(this).html());
        $("#sauce .sauces").toggleClass("visible");
        $(".ingridient-to").addClass("invisible");
    });


});

function addProduct(href) {
    $.get(href);
}

function removeProduct(href) {
    $.get(href);
}
