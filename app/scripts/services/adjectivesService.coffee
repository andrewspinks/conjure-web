'use strict'

angular.module('conjureApp')
  .service 'AdjectivesService',  ($http) ->
    adjectives = null
    currentQuestionIndex = 0

    adjectivesRequest =  ->
      $http.get('http://127.0.0.1:9393/adjectives')

    numberOfQuestions: () ->
      adjectives.length

    nextQuestion: () ->
      adjectivesRequest().then (response) ->
        adjectives = response.data
        if currentQuestionIndex == (adjectives.length - 1)
        	return false
        currentQuestion = adjectives[currentQuestionIndex]
