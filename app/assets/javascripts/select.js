(function() {
  var ready = function() {
    $('select').select2({
      allowClear: false
    }).each(function() {
      var $sel = $(this);
      var $container = $sel.data('select2').$container.find('[tabindex]').eq(0);
      $container.on('focus', function() {
        $sel.select2("open");
      });
      $container.on('keydown', function(e) {
        if(e.which === 13) {
          $container.parents('form').submit();
        }
      });
    });
  };

  $(document).ready(ready);
  $(document).on('page:load', ready);
})();
