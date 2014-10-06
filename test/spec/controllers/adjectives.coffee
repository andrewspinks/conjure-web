'use strict'

describe 'Controller: AdjectivesCtrl', ->

  # load the controller's module
  beforeEach module 'conjureApp'

  AdjectivesCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    AdjectivesCtrl = $controller 'AdjectivesCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
