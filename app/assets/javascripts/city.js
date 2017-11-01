// Tease City Categories
$(() => {
  $(".cont").on({
    mouseenter: function() {
      var id = $(this).data("id");
      var ul = $("#ul-" + id);

      $.get("/cities/" + id, function(data) {
        var categories = (data.categories)
        categories.forEach(function(category){
          ul.append("<li class='cat hidden_cat'><a href='/cities/" + id + "/categories/" + category.id + "'</a>" + category.name + "</li>")
        })
      }, "json" )
    },
    mouseleave: function() {
      var id = $(this).data("id");
      var ul = $("#ul-" + id);

      ul.html("")
    }
  })
});
