Avatar.options =
    gravatarDefault: 'mm'
    customImageProperty: 'profile.avatarUrl'

Meteor.publish 'player-avatars', ->
    # This is publishing all users, which is silly, especially since
    # the client has no other data on them. It's good enough for the
    # alpha though, at least until we have friends and games.
    handle = Meteor.users.find
        'profile.avatarUrl': $exists: false
    .observe
        added: (userDoc) =>
            console.log "adding avatar for #{userDoc._id}: #{Avatar.getUrl userDoc}"
            @added 'users', userDoc._id,
                'profile.avatarUrl': Avatar.getUrl userDoc
    @onStop -> handle.stop()
    @ready()
