Router.map ->
    @configure
        trackPageView: true

    @route '/',
        name: 'home'
        fastRender: true
