$(document).ready(function(){

  $('#generator').find('input[type=text]').focus();

  $('#generator').on('submit', function(e){
    $('#oprahized').fadeOut('slow');
    var form  = $(this);
    var say   = form.find(form.find('input[type=text]'));
    form.attr('action', say.val());
  });

  $('label').inFieldLabels();

});
