class BackboneApi.Routers.Posts extends Backbone.Router
  routes:
    ''               : 'index'
    'posts/:id'      : 'show'
    'posts/:id/edit' : 'edit'

  index: ->
    eventDispatcher.trigger("index:post")
  edit: (id)->
    post = new BackboneApi.Models.Post({id: id})
    post.fetch(error: postNotFound).then ->
      eventDispatcher.trigger("edit:post", post)
  show: (id) ->
    post = new BackboneApi.Models.Post({id: id})
    post.fetch(error: postNotFound).then ->
      eventDispatcher.trigger("show:post", post)
  postNotFound = ->
    alert("Post not found....")
    Backbone.history.navigate("/", { trigger: true })
