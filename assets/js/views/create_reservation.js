import { postData } from "../common.js"

$(function () {
    $("li").removeClass("active");
    $("#create_reservation").addClass("active");

    fetch(`../apartments`)
    .then(response => response.json())
    .then(data => {
        data.forEach(apartment => {
            $("#apartment-list").append(
                `<option value='${apartment.id}'>
                ${apartment.id} ${apartment.name}
                </option>`
            );
        });
    });

    $("#submit-button").on("click", () => {
        let data = {
            "apartment_id": parseInt($("#apartment-list").val()),
            "date": $("#reservation-date").val(),
        }
        console.log(data)
        postData(`../reservations`, data)
        .then(res => console.log(res))
    })
});