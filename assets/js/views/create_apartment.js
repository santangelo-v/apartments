import { postData } from "../common.js"

$(function () {
    $("li").removeClass("active");
    $("#create_apartment").addClass("active");

    $("#submit-button").on("click", () => {
        let data = {
            "name": $("#apartment-name").val(),
            "description": $("#apartment-description").val(),
            "vacancies": 0
        }
        postData(`../apartments`, data)
        .then(res => console.log(res))
    })
});