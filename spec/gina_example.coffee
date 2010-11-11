app = require("../lib/gina_dsl")

describe "How to use gina", ->

  class Application

    constructor: ->
      @server = require('http').createServer (req, res) ->
        res.writeHead 200, { 'Content-Type': 'text/plain' }
        res.end 'Hello World'

    start: (callback) ->
      @server.listen(8888, 'localhost', callback)

    stop: ->
      @server.close()
      
  application = new Application()
  
  it "can get a resource", ->
    app.get(application, "/", {}, (response) ->
      expect(response.data).toEqual("Hello World")
      expect(response.statusCode).toEqual(200)
    )
      