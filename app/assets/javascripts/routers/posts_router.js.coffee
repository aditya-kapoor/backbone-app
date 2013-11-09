class BackboneApi.Routers.Posts extends Backbone.Router
  routes:
    ''               : 'index'
    'posts/:id/edit' : 'edit'

  index: ->
    eventDispatcher.trigger("index:post")
  edit: (id)->
    post = new BackboneApi.Models.Post({id: id})
    post.fetch(
      error: ->
        alert("Post not found....")
        Backbone.history.navigate("/", { trigger: true })
    ).then ->
      eventDispatcher.trigger("edit:post", post)