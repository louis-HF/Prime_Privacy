//= require rails-ujs
//= require_tree .
//= require jquery
//= require jquery_ujs
//= require jquery-ui/widgets/sortable
//= require rails_sortable

  document.addEventListener("DOMContentLoaded", function(event) {
    console.log(Rails)
    document.querySelectorAll('label').forEach( function(input) {

      input.addEventListener('click', function(event) {
        console.log(event.target.closest('form'));
        Rails.fire(event.target.closest('form'), 'submit');
      })
    })

    // Sortable
    $(function() {
      $('.sortable').railsSortable();
    });
  });
