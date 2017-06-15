// Load Comments
$(() => {
  $("a.load_comments").on("click", function(e){
    // Fire AJAX
    $.get(this.href).success(function(json){
      var $ol = $("div.comments ol")
      $ol.html("")
      json.forEach(function(comment){
      $ol.append("<li>" + comment.content + "</li>");
      })
    })
  e.preventDefault();
  })
});

// Create Comment
$(() => {
  $("#new_comment").on("submit", function(e){
    $.post(this.action, $(this).serialize()).success(function(response){
      $("#comment_content").val("");
      var $ol = $("div.comments ol")
      $ol.append("<li>" + response.content + "</li>");
    })
    e.preventDefault();
  })
});
