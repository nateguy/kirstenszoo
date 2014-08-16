Router.map ->
  @route 'login'
  @route 'main',
    path: '/',
    waitOn: -> Meteor.subscribe "animals"
  @route 'addanimal',
    waitOn: -> Meteor.subscribe "animals"
  @route 'registration'
  @route 'editanimal',
    path: 'animals/edit'
  @route 'blog',
    waitOn: -> Meteor.subscribe "blog"