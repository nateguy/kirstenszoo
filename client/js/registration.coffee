MinimumPasswordLength = 8

passwordIsConfirmed = (password, confirm) ->
  password == confirm

passwordIsValid = (password) ->
  password.length >= MinimumPasswordLength

createUser = (email, password) ->
  { email: email, password: password}

Template.registration.events

  'submit #registration-form': (e, t) ->

    email = t.find('#accounts-email').value
    password = t.find('#accounts-password').value
    name = t.find('#accounts-name').value
    confirm = t.find('#accounts-confirm').value

    if passwordIsValid(password)
      if passwordIsConfirmed(password, confirm)
        user = createUser(email, password)
        Accounts.createUser user, (error) ->
          if error
            alert "Please check your password"
          else
            Meteor.users.update({_id:Meteor.user()._id}, {$set:{"profile.name":name }})

    e.preventDefault()
    false