'use strict'

angular.module('conjureApp')
  .service 'AdjectivesService',  ($http) ->
    adjectives = null
    currentQuestionIndex = 0

    adjectivesRequest =  ->
      $http.get('http://hidden-eyrie-6211.herokuapp.com/adjectives')
      # $http.get('http://localhost:5000/adjectives')

    numberOfQuestions: () ->
      adjectives.length

    startSession: () ->
      adjectivesRequest().then (response) ->
          adjectives = response.data

    nextQuestion: () ->
      if currentQuestionIndex == (adjectives.length - 1)
        return false
      currentQuestionIndex++
      currentQuestion = adjectives[currentQuestionIndex]
