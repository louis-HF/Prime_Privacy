//= require rails-ujs
//= require_tree .

  document.addEventListener("DOMContentLoaded", function(event) {
    console.log(Rails)
    document.querySelectorAll('label').forEach( function(input) {

      input.addEventListener('click', function(event) {
        console.log(event.target.closest('form'));
        Rails.fire(event.target.closest('form'), 'submit');
      })
    })

  });
