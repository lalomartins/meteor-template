Router.map ->
    @configure
        trackPageView: true
        templateNameConverter: (input) -> input.replace /-/g, '_'

    @route '/',
        name: 'home'
        fastRender: true
