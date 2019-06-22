global.UI = UI;

$(function() {
    $('[data-toggle="tooltip"]').tooltip({ container: 'body', trigger: 'hover' });
    $('[data-toggle="popover"]').popover({ container: 'body', trigger: 'hover' });
});
