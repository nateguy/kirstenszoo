Router.map ->
  @route 'main', {path: '/'}
  @route 'addanimal',
    path: 'animals/add'
  @route 'editanimal',
    path: 'animals/edit'