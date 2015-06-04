<%= name_pascal %>Directive = =>
    restrict: 'AES'
    templateUrl: '/tpl/<%= name_dash %>.template.html'
    controllerAs: '<%= name_camel %>'

angular
    .module 'app.<%= name_dash %>', [
        # deps
    ]
    .controller '<%= name_dash %>', <%= name_pascal %>Directive