Template.addanimal.events
  'submit #addanimal': (e, t) ->

    name = t.find('#name').value
    image = t.find('#image').value

    Animals.insert({name: name, image: image})
    e.preventDefault()
    false