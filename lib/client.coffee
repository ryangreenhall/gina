class HttpClient
  get: (server, url, headers, endCallback) ->
    server.start ->
      request = require('http').createClient(server.port, "localhost").request("GET", url, headers)
      request.on 'response', (response) ->
        response.data = ''
        response.on 'end', ->
          server.stop()
          endCallback(response)
        response.on 'data', (data) ->
          response.data += data
      request.end()
      
  post: (server, url, headers, endCallback) ->
    server.start ->
      request = require('http').createClient(server.port, "localhost").request("POST", url, headers)
      request.on 'response', (response) ->
        response.data = ''
        response.on 'end', ->
          server.stop()
          endCallback(response)
        response.on 'data', (data) ->
          response.data += data
      request.end()
      
  delete_: (server, url, headers, endCallback) ->
    server.start ->
      request = require('http').createClient(server.port, "localhost").request("DELETE", url, headers)
      request.on 'response', (response) ->
        response.data = ''
        response.on 'end', ->
          server.stop()
          endCallback(response)
        response.on 'data', (data) ->
          response.data += data
      request.end()

exports.createClient = -> return new HttpClient()