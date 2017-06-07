// Load Comments
$(function(){
  $("a.load_comments").on("click", function(e){
    // Fire AJAX
    $.get(this.href).success(function(json){
      var $ol = $("div.comments ol") // JS Variable pointing at a jQuery object? Name it w/ a $
      $ol.html("")
      // Clear leftover content
      // iterate over each comment within json
      json.forEach(function(comment){
      // with each comment data, append an LI to the OL with the comment content
      $ol.append("<li>" + comment.content + "</li>");
      })
    })
  e.preventDefault();
  })
})

// Prev / Next (#recent)
$(function(){
  $("a.load_comments").on("click", function(e){
    // Fire AJAX
    $.get(this.href).success(function(json){
      var $ol = $("div.comments ol") // JS Variable pointing at a jQuery object? Name it w/ a $
      $ol.html("")
      // Clear leftover content
      // iterate over each comment within json
      json.forEach(function(comment){
      // with each comment data, append an LI to the OL with the comment content
      $ol.append("<li>" + comment.content + "</li>");
      })
    })
  e.preventDefault();
  })
})
