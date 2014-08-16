Template.meet_submit.events = {
  'click input[type=submit]': function(e) {
    e.preventDefault();

    var selectedPostId = Session.get('selectedPostId');
    var post = Posts.findOne(selectedPostId);

    var categories = [];
    $('input[name=category]:checked').each(function() {
      categories.push($(this).val());
    });

    var properties = {
      title:         $('#title').val(),
      url:           $('#url').val(),
      body:          $('#body').val(),
      categories:    categories,
    };

    Posts.update(selectedPostId, {$set: properties}, function(error) {
      if (error) {
        alert(error.reason);
      }
    });
  },

};