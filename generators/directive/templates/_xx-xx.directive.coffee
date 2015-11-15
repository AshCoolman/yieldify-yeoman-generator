<%= nameCamel %>Directive = ->
    restrict: 'AES'
    templateUrl: '/tpl/<%= nameDash %>.template.html'
    controllerAs: '<%= nameCamel %>'
    scope: {}

angular
    .module 'app.<%= module %>'
    .directive '<%= nameCamel %>', <%= nameCamel %>Directive
