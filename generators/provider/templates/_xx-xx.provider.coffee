<%= name_pascal %>Provider = ->

    # Members shared between service and provider
    sharedInterface = {}

    # Config phase concerns are below.

    # Add a call to config during app's config phase (see bottom for example)
    @config = (configObj) =>
        sharedInterface.configObj = configObj
    

    # Run phase concerns are below.

    # Service constructor
    <%= name_pascal %>Service = ($routeParams) ->
        @serviceMethod = (params) => #
        _.extend @, sharedInterface
        @

    # Create service (auto-called)
    @$get = ($rootScope) =>
        # Glue
        # Create service
        new <%= name_pascal %>Service $routeParams

    _.extend @, sharedInterface
    @

angular
    .module 'app.<%= module %>', []
    .provider '<%= name_pascal %>Provider', <%= name_pascal %>Provider


# Example: calling config
# 
# angular
#     .module 'app', []
#     .config () ->
#         <%= name_pascal %>Provider.config {configPhaseAt: (new Date()).toISOString()}