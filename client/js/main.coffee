

Template.main.helpers
  allanimals: ->
    allAnimals = Pets.find().fetch()


    return allAnimals
  firstanimal: ->
    return Pets.findOne()

Template.main.rendered = ->
  $('nav').css("background-color", "rgba(255,183,9, 0)")

Template.main.events
  'click #gotoPet': (e, t) ->

    Router.go('animal', {_id: this._id})
    e.preventDefault()
    false

Template.animal.helpers

  getName: ->
    alert this
    this.name