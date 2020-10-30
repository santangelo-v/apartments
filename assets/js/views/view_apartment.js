import { postData } from "../common.js"

$(function () {
    $("li").removeClass("active");
    let id = $("#apartment-id").text();

    fetch(`../apartments/${id}`)
    .then(response => response.json())
    .then(data => {
        $("#apartment-name-title").text(data.name);    
        $("#apartment-name").val(data.name);    
        $("#apartment-description").val(data.description);
        $("#apartment-location").val(data.location);       
        data.reservations.forEach(reservation => {
            $("#apartment-reservations").append(`<option value='${reservation.date}'>${reservation.date}</option>`);
        });
    });
    $("#submit-button").on("click", () => {
        let data = {
            "name": $("#apartment-name").val(),
            "description": $("#apartment-description").val(),
            "location": $("#apartment-location").val()
        }
        postData(`../apartments/${id}`, data, 'PATCH')
        .then(res => console.log(res))
    })

    
});