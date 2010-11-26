#Gina

Provides a simple DSL for expressing the behaviour of web apps written in nodejs.

## Gina in action

    gina = require("../lib/gina")

    describe "How to use gina", ->

      class Application

        constructor: ->
          @port = 8888
          @server = require('http').createServer (req, res) ->
            responses = 
              GET: "Getting Hello world"
              POST: "Posting to Hello world"
              DELETE: "Deleting..."
              PUT: "Putting..."
        
            res.writeHead 200, { 'Content-Type': 'text/plain' }
            res.end responses[req.method]

        start: (callback) ->
          @server.listen(@port, 'localhost', callback)

        stop: ->
          @server.close()
      
      beforeEach () ->
        gina.register new Application()
    
      it "can get a resource", ->
        get("/", {}, (response) ->
           expect(response.data).toEqual "Getting Hello world"
           expect(response.statusCode).toEqual 200
        )
    
      it "can post to a resource", ->
        post("/", {}, (response) ->
          expect(response.data).toEqual "Posting to Hello world"
        )
    
      it "can delete a resource", ->
        delete_("/", {}, (response) ->
          expect(response.data).toEqual "Deleting..."
        )
    
      it "can put a resource", ->
        put("/", {}, (response) ->
          expect(response.data).toEqual "Putting..."
        )