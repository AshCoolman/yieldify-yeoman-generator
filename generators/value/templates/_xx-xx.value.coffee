<%= name_pascal %>Value =
    name: '<%= name_pascal %>'

angular
    .module 'app.<%= module %>'
    .value '<%= name_camel %>Value', <%= name_pascal %>Value

###*
 * <%= name_camel %>Value
###