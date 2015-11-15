<%= nameCamel %>Value =
    name: '<%= nameCamel %>'

angular
    .module 'app.<%= module %>'
    .value '<%= nameCamel %>Value', <%= nameCamel %>Value

###*
 * <%= nameCamel %>Value
###