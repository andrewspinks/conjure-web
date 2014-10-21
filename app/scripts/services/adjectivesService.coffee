'use strict'

angular.module('conjureApp')
  .service 'AdjectivesService',  ($http) ->
    adjectives = null
    currentQuestionIndex = 0

    adjectivesRequest =  ->
      $http.get('http://hidden-eyrie-6211.herokuapp.com//adjectives')

    numberOfQuestions: () ->
      adjectives.length

    nextQuestion: () ->
      adjectivesRequest().then (response) ->
        adjectives = response.data
        if currentQuestionIndex == (adjectives.length - 1)
        	return false
        currentQuestion = adjectives[currentQuestionIndex]
