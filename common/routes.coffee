Router.map ->
    @configure
        trackPageView: true
        layoutTemplate: 'layout'

    @route '/',
        name: 'home'
        fastRender: true

    @route 'profile',
        fastRender: true

    @plugin 'ensureSignedIn',
        except: ['atForgotPassword', 'about']
