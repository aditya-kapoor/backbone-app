class BackboneApi.Views.Posts extends Backbone.View
  tagName: "tbody",
  initialize: ->
    @collection.on("sync", @addPost, @)
  render: ->
    @collection.each (post) ->
      postView = new BackboneApi.Views.Post({model: post })
      @$el.append(postView.render().el)
    , @
    @
  addPost: (post)->
    postView = new BackboneApi.Views.Post({model: post})
    @$el.append(postView.render().el)