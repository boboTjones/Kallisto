$(document).ready(function() {  
    $('nav li').removeClass('active');
    var activeTab = $('#nav').attr('class');
    $('li.' + activeTab).addClass('active');
});