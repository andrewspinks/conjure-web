'use strict'

angular.module('conjureApp')
  .service 'VerbsService',  ($http) ->
    verbs = null
    currentQuestionIndex = 0

    verbsRequest =  ->
      $http.get('http://hidden-eyrie-6211.herokuapp.com/verbs')
      # $http.get('http://localhost:9393/verbs')

    numberOfQuestions: () ->
      verbs.length

    startSession: () ->
      verbsRequest().then (response) ->
        verbs = response.data.questions

    nextQuestion: () ->
      if currentQuestionIndex == (verbs.length - 1)
        return false
      currentQuestionIndex++
      currentQuestion = verbs[currentQuestionIndex]
