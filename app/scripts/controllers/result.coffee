'use strict'

angular.module('conjureApp')
  .controller 'ResultCtrl', ($scope) ->

    $scope.nextQuestion = ->
      $scope.$emit('nextQuestion')
