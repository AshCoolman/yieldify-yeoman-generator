<%= namePascal %>Provider = ->

    # Members shared between service and provider
    sharedInterface = {}

    # Config phase concerns are below.

    # Add a call to config during app's config phase (see bottom for example)
    @config = (configObj) =>
        sharedInterface.configObj = configObj
    

    # Run phase concerns are below.

    # Service constructor
    <%= namePascal %>Service = ($routeParams) ->
        @serviceMethod = (params) => #
        _.extend @, sharedInterface
        @

    # Create service (auto-called)
    @$get = ($rootScope) =>
        # Glue
        # Create service
        new <%= namePascal %>Service $routeParams

    _.extend @, sharedInterface
    @

angular
    .module 'app.<%= module %>'
    .provider '<%= namePascal %>Provider', <%= namePascal %>Provider


# Example: calling config
# 
# angular
#     .module 'app', []
#     .config () ->
#         <%= namePascal %>Provider.config {configPhaseAt: (new Date()).toISOString()}