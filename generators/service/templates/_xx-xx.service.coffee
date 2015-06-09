<%= name_pascal %>Service = ->

    # PRIVATE
    __private = {

    }

    # PUBLIC
    
    
    # INTERFACE
    {
        __private
    }

angular
    .module 'app.<%= module %>'
    .factory '<%= name_camel %>Service', <%= name_pascal %>Service

###*
 * <%= name_camel %>Service
 * 
 * Private functions prepended with "_" and put in"__private" for testing easy testing
###