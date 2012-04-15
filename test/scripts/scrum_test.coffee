Tests  = require('../tests')
assert = require 'assert'
helper = Tests.helper()

require('../../src/scripts/scrum') helper

# start up a danger room for hubot
danger = Tests.danger helper, (req, res, url) ->
  res.writeHead 200
  res.end JSON.stringify(
    {responseData: {results: [
      {unescapedUrl: url.query }
    ]}}
  )

# callbacks for when hubot sends messages
tests = [
  (msg) -> assert.equal "", msg
]

# run the async tests
danger.start tests, ->
  helper.receive 'is it time for scrum?'
