
  # if (Meteor.isClient)
  #   Dropzone.autoDiscover = false
  #   new Dropzone "form#dropzone",
  #     accept: (file, done) ->
  #       FS.Utility.eachFile event, (file) ->
  #         Images.insert file, (err, fileObj) ->
  #           if err
  #             alert "Error exists: ", err
  #           else
  #             console.log 'success'
  #             fileId = fileObj._id
  #             userId = Meteor.userId()
  #             Meteor.users.update userId,
  #               $set:
  #                 'profile.imageId': fileId
  #       done()
  #       imageId = null


