'use strict'

angular.module('conjureApp')
  .controller 'AdjectivesCtrl', ($scope, $http, AdjectivesService) ->
    $scope.guess = ""
    $scope.numberCorrect = 0
    $scope.numberIncorrect = 0
    $scope.answerbox = "views/question.html"

    $scope.$on('correctAnswer', (event, args) ->
      console.log("guessed correctly: #{args}")
      $scope.numberCorrect += 1
      $scope.guess = args
      $scope.answerbox = "views/result.html"
      $scope.currentQuestion.correct = true
    )

    $scope.$on('incorrectAnswer', (event, args) ->
      console.log("guessed incorrectly: #{args}")
      $scope.numberIncorrect += 1
      $scope.answerbox = "views/result.html"
      $scope.guess = args
      $scope.currentQuestion.correct = false
    )

    $scope.$on('nextQuestion', (event, args) ->
      nextQuestion()
    )

    nextQuestion = ->
      AdjectivesService.nextQuestion().then (question) =>
        $scope.currentQuestion = question
        $scope.answerbox = "views/question.html"
        $scope.numberOfQuestions = AdjectivesService.numberOfQuestions()

    nextQuestion()

