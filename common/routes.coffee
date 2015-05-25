Router.map ->
    @configure
        trackPageView: true
        layoutTemplate: 'layout'

    @route '/',
        name: 'home'
        fastRender: true
