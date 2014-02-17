window.BackboneApi =
  Models:       {}
  Collections:  {}
  Views:        {}
  Routers:      {}
  initialize: ->
    @bindEvents()
    router = new BackboneApi.Routers.Posts()
    Backbone.history.start()
  bindEvents: ->
    eventDispatcher.on "index:post", ->
      postsCollection = new BackboneApi.Collections.Posts()
      postsCollection.fetch().then ->
        postsIndexView = new BackboneApi.Views.PostsIndex({collection: postsCollection})
        $('#posts').html(postsIndexView.render().el)
    eventDispatcher.on "edit:post", (post) ->
      editPostView = new BackboneApi.Views.EditPost({model: post})
      $('#posts').html(editPostView.el)
    eventDispatcher.on "show:post", (post) ->
      showPostView = new BackboneApi.Views.ShowPost({model: post})
      $('#posts').html(showPostView.el)