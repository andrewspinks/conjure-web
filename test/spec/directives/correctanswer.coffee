'use strict'

describe 'Directive: correctAnswer', ->

  # load the directive's module
  beforeEach module 'conjureApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<correct-answer></correct-answer>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the correctAnswer directive'
