class BackboneApi.Views.Post extends Backbone.View
  tagName: "tr",
  template: JST['posts/post'],
  initialize: ->
    @model.on("destroy", @remove, this)
    @model.on("change", @render, this)
  events: 
    "click a.delete" : "deletePost"
    "click a.edit"   : "editPost"
  render: ->
    @$el.html(@template(post: this.model))
    this
  deletePost: (event)->
    answer = confirm("Are you sure?")
    if answer
      @model.destroy()
      event.preventDefault()
      Backbone.history.navigate("/", {trigger: true})
  editPost: ->
    eventDispatcher.trigger("edit:post", @model)