Meteor.publish "pets", ->
  Pets.find({})

Meteor.publish "picture", ->
  Images.find({})

Meteor.publish "contents", (options) ->
  Content.find({})
