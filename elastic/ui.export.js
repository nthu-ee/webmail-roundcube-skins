global.UI = UI;

$(() => {
  $('[data-toggle="tooltip"]').tooltip({ container: 'body', trigger: 'hover' });
  $('[data-toggle="popover"]').popover({ container: 'body', trigger: 'hover' });
});
