'use strict'

angular.module('conjureApp')
  .controller 'QuestionCtrl', ($scope) ->
    $scope.guess = ""

    $scope.answer = ->
      console.log($scope.guess + " >>> " + $scope.currentQuestion.answer)
      if $scope.guess == $scope.currentQuestion.answer
      	$scope.$emit('correctAnswer', $scope.guess)
      else
      	$scope.$emit('incorrectAnswer', $scope.guess)

