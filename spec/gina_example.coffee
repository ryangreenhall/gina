gina = require("../lib/gina")

describe "How to use gina", ->

  class Application

    constructor: ->
      @port = 8888
      @server = require('http').createServer (req, res) ->
        res.writeHead 200, { 'Content-Type': 'text/plain' }
        res.end 'Hello World'

    start: (callback) ->
      @server.listen(@port, 'localhost', callback)

    stop: ->
      @server.close()
  
  gina.register new Application()
  
  it "can get a resource", ->
    
    get("/", {}, (response) ->
      expect(response.data).toEqual("Hello World")
      expect(response.statusCode).toEqual(200)
    )
      