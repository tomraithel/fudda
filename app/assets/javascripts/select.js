(function() {
  var ready = function() {
    $('select').select2({
      allowClear: true
    });
  };

  $(document).ready(ready);
  $(document).on('page:load', ready);
})();
