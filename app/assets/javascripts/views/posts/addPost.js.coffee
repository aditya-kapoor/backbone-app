class BackboneApi.Views.AddPost extends Backbone.View
  template: JST["posts/add"],
  events:
    'submit'        : "createNewPost"
    'click .cancel' : "cancelForm"
  render: ->
    @$el.html(@template())
    this
  createNewPost: (event) ->
    event.preventDefault()
    @title    = $(event.currentTarget).find('#title').val()
    @body     = $(event.currentTarget).find('#body').val()
    post      = new BackboneApi.Models.Post({title: @title, body: @body})
    if post.save({wait: true})
      @collection.add(post)
      @cancelForm()
    else
      alert(post.validationError)
  cancelForm: ->
    @remove()
