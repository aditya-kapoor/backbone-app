class BackboneApi.Views.App extends Backbone.View
  el: '.add',
  events:
    'click': "addNewPostForm"
  addNewPostForm: ->
    addPostView = new BackboneApi.Views.AddPost({collection: @collection})
    $('#addPost').html(addPostView.render().el)