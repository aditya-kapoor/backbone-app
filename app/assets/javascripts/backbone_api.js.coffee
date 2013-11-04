window.BackboneApi =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @bindEvents()
    router = new BackboneApi.Routers.Posts()
    Backbone.history.start()
  bindEvents: ->
    eventDispatcher.on "index:post", ->
      postsCollection = new BackboneApi.Collections.Posts()
      postsCollection.fetch().then ->
        postsView = new BackboneApi.Views.Posts({collection: postsCollection})
        $('#postsCollection').append(postsView.render().el)
      appView = new BackboneApi.Views.App({collection: postsCollection})
    eventDispatcher.on "edit:post", (post) ->
      editPostView = new BackboneApi.Views.EditPost({model: post})
      $('#editPost').html(editPostView.el)
