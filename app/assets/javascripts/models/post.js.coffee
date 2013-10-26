class BackboneApi.Models.Post extends Backbone.Model
  urlRoot: "/posts",
  defaults:
    "title": "",
    "body": ""
  validate: (attrs)->
    if attrs["title"].trim().length <= 0
      return "title can't be blank";
    if attrs["body"].trim().length <= 0
      return "body can't be blank";
