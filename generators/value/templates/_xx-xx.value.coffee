<%= name_pascal %>Value =
    name: '<%= name_camel %>'

angular
    .module 'app.<%= module %>'
    .value '<%= name_camel %>Value', <%= name_camel %>Value

###*
 * <%= name_camel %>Value
###