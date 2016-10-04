
var zipper = angular.module('zipper', ['templates', 'ngRoute', 'ngResource', 'controllers']);

zipper.config([
    '$routeProvider', function($routeProvider) {
        return $routeProvider.when('/', {
            templateUrl: "index.html",
            controller: 'SearchController'
        });
    }
]);

var controllers = angular.module('controllers', []);

controllers.controller("SearchController", ['$scope', '$routeParams', '$location', '$resource',
                        function($scope, $routeParams, $location, $resource) {

                            $scope.search = function(zip) {
                                return $location.path("/").search('zip', zip);
                            };

                            var persons = $resource('/search/:zip', {
                                zip: "@zip"
                            });

                            if ($routeParams.zip) {
                                persons.query({
                                    zip: $routeParams.zip
                                }, function(results) {
                                    return $scope.persons = results;
                                });
                            }
                            else
                            {
                                $scope.persons = [];
                            }
                        }]);