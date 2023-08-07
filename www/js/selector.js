// Creates the Selectize menu and defines its selection effect
$(document).ready(function () {
    $(function () {
        $("#menu").selectize({
            options: selectopts,
            labelField: 'label',
            searchField: ['label', 'value'],
            placeholder: 'Pick a team',
            delimiter: ',',
            onChange: function (value) {

                // Defines the values as function of the selection (or its absence)
                let teamid = '';
                let teampage = '';
                let teamcolor = '';
                if (value === "") {
                    teamid = '#team1';
                    teampage = 'team1.html';
                    teamcolor = '#202020';
                } else {
                    teamid = '#' + value.split(",")[0];
                    teampage = value.split(",")[0] + '.html';
                    teamcolor = value.split(",")[1];
                }

                // Apply the ID and name of the page of the selected team
                async function switcher() {

                    await new Promise((resolve) =>
                        resolve($(document.documentElement).find('.content').fadeOut('slow')),
                    );

                    await new Promise((resolve) =>
                        setTimeout(() => resolve($(document.documentElement).find('.content').attr('src', '')), 500),
                    );                

                    await new Promise((resolve) =>
                        resolve($(document.documentElement).find(teamid).attr('src', teampage)),
                    );

                    $(document.documentElement).find(teamid).fadeIn(2000);

                }
                switcher();

                // Applies the color and shadow of the sidebar
                let styles = {
                    backgroundColor: teamcolor,
                    boxShadow: teamcolor + " 2px 0 6px 3px"
                };
                $(document.documentElement).find('#sidebar').css(styles);
            }
        });
    });
});