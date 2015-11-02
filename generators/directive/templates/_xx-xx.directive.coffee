<%= name_camel %>Directive = ->
    restrict: 'AES'
    templateUrl: '/tpl/<%= name_dash %>.template.html'
    controllerAs: '<%= name_camel %>'
    scope: {}

angular
    .module 'app.<%= module %>'
    .directive '<%= name_camel %>', <%= name_camel %>Directive
