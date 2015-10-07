<%= name_camel %>Constant =
    name: '<%= name_camel %>'

angular
    .module 'app.<%= module %>'
    .constant '<%= name_camel %>Constant', <%= name_camel %>Constant

###*
 * <%= name_camel %>Constant
###