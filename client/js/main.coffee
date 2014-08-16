

Template.main.helpers
  allanimals: ->
    allAnimals = Animals.find().fetch()


    return allAnimals
  firstanimal: ->
    return Animals.findOne()

Template.main.rendered = ->
  $('nav').css("background-color", "rgba(255,183,9, 0)")
