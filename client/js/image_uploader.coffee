Meteor.subscribe('pets')
Meteor.subscribe('picture')
Meteor.subscribe('images')

Template.addanimal.helpers
  name: -> Meteor.pets.name
  gender: -> Meteor.pets.gender
  breed: -> Meteor.pets.race
  Age: -> Meteor.pets.age
  Size: -> Meteor.pets.size
  location: -> Meteor.pets.location
  bio : -> Meteor.pets.bio




#   bio:           -> Meteor.user().profile.bio if Meteor.user()
#   email:         -> Meteor.user().emails[0].address if Meteor.user() and Meteor.user().emails?
#   firstName:     -> Meteor.user().profile.firstName if Meteor.user()
#   lastName:      -> Meteor.user().profile.lastName if Meteor.user()
#   location:      -> Meteor.user().profile.location if Meteor.user()
#   organization:  -> Meteor.user().profile.organization if Meteor.user()
#   url:           -> Meteor.user().profile.url if Meteor.user()
#   googlePlusUrl: -> Meteor.user().profile.googlePlusUrl if Meteor.user()
#   twitterHandle: -> Meteor.user().profile.twitterHandle if Meteor.user()
imageId = undefined



Template.addanimal.rendered = () ->
  $('#bio').keydown (event) ->
    if event.keyCode == 13
      $('#bio').blur()
  if (Meteor.isClient)
    Dropzone.autoDiscover = true
    new Dropzone "form#dropzone",
      accept: (file, done) ->
        Images.insert file, (err, fileObj) ->
          if err
            alert "Error exists: ", err
          else
            console.log "this is here"
            console.log imageId = fileObj._id
        done()

Template.userCard.helpers
  profileImage:  ->
    # if Meteor.user()
      imgUrl = Images.findOne(_id: imageId).url()
      imageTag = "<img src='#{imgUrl}' />"

Template.addanimal.events
  'click .done': ->
    name = document.getElementById("name").value
    bio = document.getElementById("bio").value
    location = document.getElementById("location").value
    breed = document.getElementById("breed").value
    age = document.getElementById("age").value
    size = document.getElementById("size").value
    imgUrl = Images.findOne(_id: imageId).url()
    imageTag = "<img src='#{imgUrl}' />"
    Pets.insert({name : name, location : location, biography : bio, Breed : breed, Age : age, size : size, photo : imageId, link : imgUrl})







  #   if Meteor.user().profile.firstName
  #     Router.go('/')
  #   else
  #     $('.errors').text('First name is required.')

  # 'change #email': (event) ->
  #   Meteor.call('changeEmail', Meteor.userId(), $(event.target).val())

  # 'change #firstName': (event) ->
  #   Meteor.users.update Meteor.userId(),
  #     $set:
  #       'profile.firstName': $(event.target).val()

  # 'change #lastName': (event) ->
  #   Meteor.users.update Meteor.userId(),
  #     $set:
  #       'profile.lastName': $(event.target).val()

  # 'change #organization': (event) ->
  #   Meteor.users.update Meteor.userId(),
  #     $set:
  #       'profile.organization': $(event.target).val()

  # 'change #location': (event) ->
  #   Meteor.users.update Meteor.userId(),
  #     $set:
  #       'profile.location': $(event.target).val()

  # 'change #bio': (event) ->
  #   Meteor.users.update Meteor.userId(),
  #     $set:
  #       'profile.bio': $(event.target).val()


