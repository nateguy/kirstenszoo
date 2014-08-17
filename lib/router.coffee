Router.map ->
  @route 'login'
  @route 'main',
    path: '/',
    waitOn: -> Meteor.subscribe "animals"
  @route 'addanimal',
    waitOn: -> Meteor.subscribe "animals"
  @route 'registration'
  @route 'animal',
    path: 'animal/:_id',
    data: ->
      return Pets.findOne({_id: this.params._id})
  @route 'editanimal',
    path: 'animals/edit'
  @route 'blog',
    waitOn: -> Meteor.subscribe "blog"