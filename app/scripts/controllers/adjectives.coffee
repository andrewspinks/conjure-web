'use strict'

angular.module('conjureApp')
  .controller 'AdjectivesCtrl', ($scope, $http) ->
  	$scope.answers = {}

  	$scope.answer = (item) -> 
      console.log("Answered item #{item}")

  	$http.get('http://127.0.0.1:9393/adjectives').then (response) ->
      $scope.adjectives = response.data
