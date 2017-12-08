$(function(){
  // Load Comments
  // $(() => {
  //   $("a.load_comments").on("load", function(e){
  //     $.get(this.href).success(function(json){
  //       var $ol = $("div.comments ol")
  //       $ol.html("")
  //       json.forEach(function(comment){
  //         $ol.append("<li>" + comment.content + "</li>");
  //       })
  //     })
  //   e.preventDefault();
  //   })
  // });

  // Create Comment
  $(() => {
    function Comment(data) {
      this.id = data.id;
      this.content = data.content;
    }

    Comment.prototype.postComment = function() {
      $("#comment_content").val("");
      var $ol = $("div.comments ol")
      $ol.append("<li class='comment'>" + this.content + "</li>");
    }

    $("form#new_comment").submit(function(e){
      $.post(this.action, $(this).serialize(),
        function(response){
          var comment = new Comment(response);
          comment.postComment();
          $('input:submit').attr('disabled', false)
        }, "json");
      e.preventDefault();
    })
  })
});
