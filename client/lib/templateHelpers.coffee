# Have to keep this separately, because Jade at the moment doesn't allow
# passing arguments

Template.registerHelper 'space', -> ' '

@TemplateHelpers =
    displayDateFull: (date) ->
        moment(date).format('dddd, YYYY-MM-DD h:mma Z')

    displayDateShort: (date) ->
        moment(date).fromNow()

    pluralize: (number, singular, plural) ->
        # single point so it's easier to internationalize later
        if number is 1
            singular
        else
            plural

    displayName: (profile) ->
        profile ?= @
        profile = profile.profile ? profile
        assembled = if profile.first and profile.last
            "#{profile.first} #{profile.last}"
        profile.displayName ? profile.name ? assembled ? profile.username

    add: (name, fn) ->
        TemplateHelpers[name] = fn
        Template.registerHelper name, fn

for name, fn of TemplateHelpers
    if name isnt 'add'
        Template.registerHelper name, fn

Template::bindDateDisplay = ->
    @.events
        'touchend .date-display': (event) ->
            if event.currentTarget.title
                alert event.currentTarget.title
