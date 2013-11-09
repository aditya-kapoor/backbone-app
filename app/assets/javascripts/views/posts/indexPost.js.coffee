class BackboneApi.Views.PostsIndex extends Backbone.View
  template: JST['posts/index'],
  events:
    'click .add': "addNewPostForm"
  render: ->
    @$el.html(@template)
    @renderPosts()
    this
  # Crude example of how 2-column or 3-column templating system 
  # are integrated into the System by BackboneJS
  renderPosts: ->
    postsView = new BackboneApi.Views.Posts({collection: @collection})
    @$el.find('#postsCollection').append(postsView.render().el)
  addNewPostForm: ->
    addPostView = new BackboneApi.Views.AddPost({collection: @collection})
    @$el.find('#addPost').html(addPostView.render().el)