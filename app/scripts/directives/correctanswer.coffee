'use strict'

angular.module('conjureApp')
  .directive('correctAnswer', ->
    restrict: 'A',
    require: 'ngModel',
    link: (scope, element, attrs, modelCtrl) ->
      # element.text 'this is the correctAnswer directive'
      modelCtrl.$parsers.unshift( (viewValue) ->
        if viewValue == attrs.correctAnswer
          modelCtrl.$setValidity('correctAnswer', true);
          return viewValue
        else
          modelCtrl.$setValidity('correctAnswer', false)
      )
  )