'use strict'

angular.module('conjureApp')
  .directive('ngEnter', ->
    restrict: 'A',
    link: (scope, element, attrs) ->
      element.focus();
      element.bind("keydown keypress", (event) ->
        if event.which == 13
          scope.$apply(->
            scope.$eval(attrs.ngEnter)
          )
          event.preventDefault();
      )
  )