export function <%= namePascal %> () {
    return {
        scope: true,
        restrict:'AE',
        template: `
<h3>Ng One: {{<%= nameCamel %>.title}}</h3>
        `,
        controllerAs: '<%= nameCamel %>',
        bindToController: {
            title: '@'
        },
        controller: class <%= namePascal %>Ctrl{

            static $inject:string[] = ['$scope'];

            constructor (
                $scope:any,
                public title:string = "<%= namePascal %> component"
            ) {
            }
        }
    };
};

// import {<%= namePascal %>} from '<%= moduleLoc %>';