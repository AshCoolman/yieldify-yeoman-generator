<%= nameCamel %>Controller = ->
    # PRIVATE: prepend names _myPrivateFunc
    
    # PUBLIC: to be placed on vm
    
    # GLUE: $watch, $on etc
    
    # INTERFACE
    vm = @
    vm

angular
    .module 'app.<%= module %>'
    .controller '<%= nameCamel %>Controller', <%= nameCamel %>Controller