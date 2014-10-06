'use strict'

###*
 # @ngdoc overview
 # @name conjureApp
 # @description
 # # conjureApp
 #
 # Main module of the application.
###
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
      .when '/',
        templateUrl: 'views/adjectives.html'
        controller: 'AdjectivesCtrl'
      .otherwise
        redirectTo: '/'

