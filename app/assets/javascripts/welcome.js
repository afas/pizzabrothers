$(document).ready(function () {

//    Pizza builder
    $(".ingridient-from").click(function () {
        id = $(this).attr("id") + "_to";
        console.log(id);
        $("#" + id).removeClass("invisible");
    });

    $(".ingridient-to").click(function () {
        $(this).addClass("invisible");
    });

    $(".ingridient-to").click(function () {
        $(this).addClass("invisible");
    });

    $("#sauce .link").on("click", function () {
        $("#sauce .sauces").toggleClass("visible");
    });

    $("#product-size .link").on("click", function () {
        $("#product-size .product-sizes").toggleClass("visible");
    });

    var price_variable_id = "";

    $("#product-sizes li").click(function () {
        price_variable_id = "product_price_" + $(this).attr("short_name");
        $("#" + price_variable_id).val(1000);
    });

    $("#sauce li").click(function () {
        console.log($(this).html());
    });


});

function addProduct(href) {
    $.get(href);
}

function removeProduct(href) {
    $.get(href);
}
