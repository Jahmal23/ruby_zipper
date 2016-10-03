zipper = angular.module('zipper',[
  'templates',
  'ngRoute',
  'controllers',
])

zipper.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
    .when('/',
      templateUrl: "index.html"
      controller: 'SearchController'
    )
])

controllers = angular.module('controllers',[])
controllers.controller("SearchController", [ '$scope',
  ($scope)->
])