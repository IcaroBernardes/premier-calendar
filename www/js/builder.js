// Insere os iframes dentro de #container
$(document).ready(function () {
    // Cria a estrutura HTML em forma de string
    let listHTML = teams.map((el) => {
        return "<iframe class='content' id='" + el + "' src=''>";
    });

    // Adiciona o placeholder sem opacidade e com atributo "src" preenchido
    listHTML.push("<iframe class='content' id='time1' src='time1.html' style='display:inline;'>");

    // Aplica a string ao #container como uma estrutura HTML
    $("#container").html(listHTML);
});