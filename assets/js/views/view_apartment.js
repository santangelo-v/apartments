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
            $("#apartment-reservations").append(
                `<option value='${reservation.id}'>
                    ${reservation.date}
                    ${reservation.weather ? "Weather data available" : "Weather data unavailable"}
                </option>`
            );

            if (reservation.weather)
                $("#weather-info-section").append(
                    `<div id="weather_${reservation.id}" class="d-none weather-info">
                    <h4 for="apartment-location">Weather info <small>${reservation.date}</small></h4>
                    <dl class="row">
                    <dt class="col-sm-3">Temperature</dt>
                    <dd class="col-sm-9">${reservation.weather.temperature}°</dd>
                    <dt class="col-sm-3">Humidity</dt>
                    <dd class="col-sm-9">${reservation.weather.umidity}%</dd>
                    <dt class="col-sm-3">Good weather?</dt>
                    <dd class="col-sm-9 ${reservation.weather.is_good_weather ? "text-success" : "text-danger"}">${reservation.weather.is_good_weather ? "Yes" : "No"}</dd>
                    </dl>
                </div>`
                );
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

    $('#apartment-reservations').on('change', function() {
        $(".weather-info").addClass("d-none");
        $(`#weather_${this.value}`).removeClass("d-none");
    });
});