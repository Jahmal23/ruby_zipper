var zipper;

zipper = angular.module('zipper', ['templates', 'ngRoute', 'ngResource', 'controllers']);

zipper.config([
    '$routeProvider', function($routeProvider) {
        return $routeProvider.when('/', {
            templateUrl: "index.html",
            controller: 'SearchController'
        });
    }
]);

var controllers;

controllers = angular.module('controllers', []);

controllers.controller("SearchController", ['$scope', '$routeParams', '$location', '$resource',
                        function($scope, $routeParams, $location, $resource) {





                        }





                        ]);