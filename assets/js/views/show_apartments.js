$(function () {
    $("li").removeClass("active");
    $("#show_apartments").addClass("active");

    fetch('./apartments')
        .then(response => response.json())
        .then(data =>
            data.forEach(ap => {
                $("#apartments-row").append(
                    `<div class='col border border-secondary rounded apartment' style='padding: 2.5rem; margin-right: 1rem;'>
                        <blockquote class='blockquote'>
                            <p class='mb-0'>${ap.name}</p>
                            <footer class='blockquote-footer'>${ap.location}</footer>
                        </blockquote>
                        <p>${ap.description}</p>
                        <a type='button' class='btn btn-secondary' href='./view_apartment/${ap.id}'>View</a>
                    </div>`
                )
            }))
});

