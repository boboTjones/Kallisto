$(document).ready(function() {  
    $('nav li').removeClass('active');
    var activeTab = $('#nav').attr('class');
    $('li.' + activeTab).addClass('active');

    $.getJSON('calendar/dow', function(data) {
      for ( x in data ) {
        var dow = x;
        var loc = data[x];
        $("td:eq(" + loc + ")").find("label").append(dow);
      }
      });
    

});