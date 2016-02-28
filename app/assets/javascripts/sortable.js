var $table = $(".table--sortable");

var getIdsInOrder = function() {
  var $trs = $table.find('tr');
  return $trs.toArray()
    .filter(function(tr) {
      return $(tr).data('id') !== undefined;
    })
    .map(function(tr) {
      return $(tr).data('id');
    });
};

$table.find('tbody').sortable({
  update: function(event, ui) {
    var ids = getIdsInOrder();
    var authToken = $('meta[name=csrf-token]').attr('content');
    $.post($table.data('reorderUrl'), {
      ids: ids,
      authenticity_token: authToken
    });
  }
});