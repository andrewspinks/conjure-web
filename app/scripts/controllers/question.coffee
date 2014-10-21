'use strict'

angular.module('conjureApp')
  .controller 'QuestionCtrl', ($scope) ->
    $scope.guess = ""

    $scope.answer = ->
      console.log($scope.guess + " >>> " + $scope.currentQuestion.answers)
      if correctAnswer($scope.guess)
      	$scope.$emit('correctAnswer', $scope.guess)
      else
      	$scope.$emit('incorrectAnswer', $scope.guess)

    correctAnswer = (guess) ->
      for answer in $scope.currentQuestion.answers
        if answer == guess
          return true
      return false
