'use strict'

angular
  .module('conjureApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/adjectives',
        templateUrl: 'views/adjectives.html'
        controller: 'AdjectivesCtrl'
      .when '/verbs',
        templateUrl: 'views/verbs.html'
        controller: 'VerbsCtrl'
      .otherwise
        redirectTo: '/verbs'
  .run ($rootScope, $location) ->
    $rootScope.isActive = (state) ->
      state == $location.path()
