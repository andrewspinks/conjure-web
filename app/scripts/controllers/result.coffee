'use strict'

angular.module('conjureApp')
  .controller 'ResultCtrl', ($scope) ->

    $scope.nextQuestion = ->
      $scope.$emit('nextQuestion')

    $scope.corrections = ->
      corrections = ""
      for answer in $scope.currentQuestion.answers
      	if corrections
      		corrections = "#{corrections} or #{answer}"
      	else
      		corrections = answer
      corrections
