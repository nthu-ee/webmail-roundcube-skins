global.UI = UI;

$(() => {
  $('[data-toggle="tooltip"]').tooltip({ container: 'body', trigger: 'hover' });
  $('[data-toggle="popover"]').popover({ container: 'body', trigger: 'hover' });

  // if the user uses touch device, show "mail selection" checkboxes automatically
  if ($('html').hasClass('touch')) {
    $('#messagelist').addClass('withselection');
  }
});
