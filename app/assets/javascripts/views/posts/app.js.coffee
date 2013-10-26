class BackboneApi.Views.App extends Backbone.View
  el: '#addPost',
  events:
    'submit': "createNewPost"

  createNewPost: (event) ->
    event.preventDefault()
    # 1. fetch the attribute values
    # 2. instantiate a new model object
    # 3. add it to the collection
    @title    = $(event.currentTarget).find('#title').val()
    @body     = $(event.currentTarget).find('#body').val()
    post = new BackboneApi.Models.Post({title: @title, body: @body})
    console.log(post)
    if post.save({wait: true})
      @collection.add(post)
      event.currentTarget.reset()
    else
      alert(post.validationError)
