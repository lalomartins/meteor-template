Router.map ->
    @configure
        trackPageView: true
        templateNameConverter: (input) -> input.replace /-/g, '_'

    @route 'home',
        path: '/'
        fastRender: true
