sort_ul = $('.topic-list');
itemsCount = $('.draglist-box').length;

function updateIndexes(){
    $('li input').each(function(i){
              $(this).val(i+1);
          });
}

updateIndexes();

sort_ul.sortable({handle:'.drag',
                  stop:function(event,ui){ updateIndexes(); }
});

$('.rank').keyup(function(event) {
  if(event.keyCode == '13'){
    event.preventDefault();

    order = parseInt($(this).val());

    li = $(this).parent();
    if(order>=1 && order <= itemsCount){

        li.effect('drop', function(){
            li.detach();

            if(order == itemsCount)
                sort_ul.append(li);
            else
                li.insertBefore($('.draglist-box:eq('+(order-1)+')'));

            updateIndexes();
            li.effect('slide');
        });
    }else{
        li.effect('highlight');
    }
  }
});

export { updateIndexes };
