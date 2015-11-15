<%= nameCamel %>Service = ->

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
    .factory '<%= nameCamel %>Service', <%= nameCamel %>Service

###*
 * <%= nameCamel %>Service
 * 
 * Private functions prepended with "_" and put in"__private" for testing easy testing
###