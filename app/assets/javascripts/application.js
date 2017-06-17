// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Tease City Categories
$(() => {
  $(".js-cat").on({
    mouseenter: function() {
      var id = $(this).data("id");
      var ul = $("#ul-" + id)

      $.get("/cities/" + id, function(data) {
        var categories = (data.categories)

        categories.forEach(function(category){
          ul.append("<li class='cat hidden_cat'>" + category.name + "</li>")
        })
      })
    },
    mouseleave: function() {
      var id = $(this).data("id");
      var ul = $("#ul-" + id)

      $.get("/cities/" + id, function(data) {
        var categories = (data.categories)
      })

      ul.html("")
    }
  })
});
