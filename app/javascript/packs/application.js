import "bootstrap";
import { loadDynamicBannerText } from '../components/inputbox';
// loadDynamicBannerText();
import Sortable from 'sortablejs'


// Draglist
  document.addEventListener("DOMContentLoaded", function(event) {
    const draglist = document.getElementById("draglist")
    if (draglist) {
      console.log('il y a une draglist')
      Sortable.create(draglist, {animation: 120, sort: true, touchStartThreshold: 3, scrollSpeed: 5});
    }
  });

// Pour le rang implémenter un each sur sensitivity filter et mettre un index sur le rang
document.getElementById("draglist").addEventListener("dragstart", function(e) {
    var crt = this.cloneNode(true);
    crt.style.visibility = "hidden"; /* or visibility: hidden, or any of the above */
    document.body.appendChild(crt);
    e.dataTransfer.setDragImage(crt, 0, 0);
}, false);




// Inputbox
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
    event.preventDefault()
});

document.getElementById("add-another-word").addEventListener("click", function(event){
    event.preventDefault()
    var word_list = '<input class="input-box word-input" type="text" name="topic-name" value="Word" >';
    document.getElementById('words-wrapper').innerHTML += word_list;
});

// Input new topic in draglist
document.getElementById("confirm-topic-btn").addEventListener("click", function(event){
    event.preventDefault()
    var new_topic = document.getElementById('topic-name').value;
    // Rajouter un create avec le controller pour que ça marche et recharger la page
    var new_topic_box = '<li class="draglist-box"> <p class="rank">7</p> <%= image_tag "personal.png", class: "picto personal hidden-xs" %> <p class="topic-name"> ${new_topic} </p> <% if user_signed_in? %> <a href=""> <i class="far fa-edit edit"></i> </a> <% end %> <a href=""> <i class="far fa-times-circle delete-cross"></i> </a> <i class="fas fa-arrows-alt-v drag"></i> </li>';
    document.getElementById('draglist').innerHTML += new_topic_box;
});
