<%= name_pascal %>Value =
    name: '<%= name_came %>'

angular
    .module 'app.<%= module %>'
    .value '<%= name_camel %>Value', <%= name_came %>Value

###*
 * <%= name_camel %>Value
###