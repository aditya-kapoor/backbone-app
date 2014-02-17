class BackboneApi.Views.ShowPost extends Backbone.View
  template: JST['posts/show'],
  initialize: ->
    @render()
  render: ->
    @$el.html(@template(model: @model))
    this