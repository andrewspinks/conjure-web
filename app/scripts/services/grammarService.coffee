'use strict'

angular.module('conjureApp')
  .service 'GrammarService',  ($http) ->
    grammar = null
    currentQuestionIndex = -1

    grammarRequest =  ->
      $http.get('http://hidden-eyrie-6211.herokuapp.com/grammar')
      # $http.get('http://localhost:9393/grammar')

    numberOfQuestions: () ->
      grammar.length

    startSession: () ->
      grammarRequest().then (response) ->
          grammar = response.data.questions

    nextQuestion: () ->
      if currentQuestionIndex == (grammar.length - 1)
        return false
      currentQuestionIndex++
      currentQuestion = grammar[currentQuestionIndex]
