<%= nameCamel %>Constant =
    name: '<%= nameCamel %>'

angular
    .module 'app.<%= module %>'
    .constant '<%= nameCamel %>Constant', <%= nameCamel %>Constant

###*
 * <%= nameCamel %>Constant
###