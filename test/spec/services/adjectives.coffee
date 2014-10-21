'use strict'

describe 'Service: adjectives', ->

  # load the service's module
  beforeEach module 'conjureApp'

  # instantiate service
  adjectives = {}
  beforeEach inject (_adjectives_) ->
    adjectives = _adjectives_

  it 'should do something', ->
    expect(!!adjectives).toBe true
