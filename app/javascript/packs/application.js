import "bootstrap";

// Todo condition
import Chartkick from "chartkick";
window.Chartkick = Chartkick;

import Chart from "chart.js";
Chartkick.addAdapter(Chart);

import Sortable from 'sortablejs'


// Sensitivity page
document.addEventListener("DOMContentLoaded", function(event) {
  // Draglist
  if (document.getElementById("draglist")) {
    Sortable.create(draglist, {animation: 120, sort: true, touchStartThreshold: 2, scrollSpeed: 5,
      onEnd: function (evt) {
      var itemEl = evt.item;  // dragged HTMLElement
      console.log(evt.to);    // target list
      (evt.from);  // previous list
      (evt.oldIndex);  // element's old index within old parent
      (evt.newIndex);  // element's new index within new parent
      },
    });
  }

  // Prevent ghost drag
  draglist.addEventListener("dragstart", function(e) {
    var crt = this.cloneNode(true);
    crt.style.visibility = "hidden";
    document.body.appendChild(crt);
    e.dataTransfer.setDragImage(crt, 0, 0);
  }, false);

  // New topic form management (hide-show)
  $("#add-topic-btn").click(function(){
      $("#mainform-topic").toggle("hidden");
      $("#subform-topic").toggle("hidden");
  });

  $("#confirm-topic-btn").click(function(){
      $("#mainform-topic").toggle("hidden");
      $("#subform-topic").toggle("hidden");
  });

  // Btn behaviour
  document.getElementById("add-topic-btn").addEventListener("click", function(event){
      event.preventDefault();
      var topic_name = document.getElementById('topic-name').value;
      document.getElementById('topic-name-reminder').innerHTML += topic_name;
      document.getElementById('keyword-explanation').innerHTML += "Please add the words linked to the topic: " + topic_name;
  });

  document.getElementById("add-another-word").addEventListener("click", function(event){
      event.preventDefault();
      const wordinputs = document.getElementById("words-wrapper");
      const input = document.createElement("input");
      input.name = "keyword[]";
      input.classList = "input-box word-input";
      input.type = "text";
      input.placeholder = "New word"
      wordinputs.appendChild(input);
  });

  // Inputs empty out when typing
  document.getElementById("topic-name").addEventListener("click", function(event){
      document.getElementById('topic-name').value = '';
  });
});

jQuery(document).ready(function(){
  jQuery(".word-input").focus(function(){
    if(jQuery(this).val() === 'Word'){
      jQuery(this).val('');
    }
  });
  jQuery(".word-input").blur(function(){
    if(jQuery(this).val() === ''){
      jQuery(this).val('Word');
    }
  });

  // AJAX
  // function refreshForm(innerHTML) {
  //   const newKeywordForm = document.getElementById('new_keyword');
  //   newKeywordForm.innerHTML = innerHTML;
  // }

  // function addkeyword(keywordHTML) {
  //   const keywords = document.getElementById('keywords');
  //   keywords.insertAdjacentHTML('beforeend', keywordHTML);
  // }

  // <% if @keyword.errors.any? %>
  //   refreshForm('<%= j render "keywords/form", topic: @topic, keyword: @keyword %>');
  // <% else %>
  //   addKeyword('<%= j render "keywords/show", keyword: @keyword %>');
  //   refreshForm('<%= j render "keywords/form", topic: @topic, keyword: Keyword.new %>');
  // <% end %>
  // AJAX

});


// Devise alert automatic remove
window.setTimeout(function() {
    $(".alert-dismissible").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove();
    });
}, 3000);
