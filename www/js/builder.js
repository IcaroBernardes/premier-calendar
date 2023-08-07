// Places the iframes inside #container 
$(document).ready(function () {
    // Creates the HTML structure as a string
    let listHTML = teams.map((el) => {
        return "<iframe class='content' id='" + el + "' src=''>";
    });

    // Adds the placeholder with zero opacity and the "src" attribute filled
    listHTML.push("<iframe class='content' id='team1' src='team1.html' style='display:inline;'>");

    // Applies the string to #container as an HTML structure
    $("#container").html(listHTML);
});