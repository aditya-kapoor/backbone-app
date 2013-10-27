class BackboneApi.Views.EditPost extends Backbone.View
  template: JST['posts/edit'],
  initialize: ->
    @render()
  events: 
    'submit'        : "updatePost"
    'click .cancel' : "cancelForm"
  render: ->
    @$el.html(@template(model: @model))
    this
  updatePost: (event)->
    event.preventDefault()
    title = @$el.find('#edit_title').val()
    body  = @$el.find('#edit_body').val()
    @model.save({title: title, body: body})
    @cancelForm()
  cancelForm: ->
    @remove()