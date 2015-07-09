<%= name_camel %>Directive = ->
    console.log 'directive: ', <%= name_camel %>
    restrict: 'AES'
    templateUrl: '/tpl/<%= name_dash %>.template.html'
    controllerAs: '<%= name_camel %>'

angular
    .module 'app.<%= module %>'
    .directive '<%= name_camel %>', <%= name_camel %>Directive