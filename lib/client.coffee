doRequest = (method, server, url, headers, endCallback) ->
  server.start ->
     request = require('http').createClient(server.port, "localhost").request(method, url, headers)
     request.on 'response', (response) ->
       response.data = ''
       response.on 'end', ->
         server.stop()
         endCallback(response)
       response.on 'data', (data) ->
         response.data += data
     request.end()

class HttpClient
  get: (server, url, headers, endCallback) ->
    doRequest "GET", server, url, headers, endCallback
      
  post: (server, url, headers, endCallback) ->
    doRequest "POST", server, url, headers, endCallback
      
  delete_: (server, url, headers, endCallback) ->
    doRequest "DELETE", server, url, headers, endCallback
    
  put: (server, url, headers, endCallback) ->
    doRequest "PUT", server, url, headers, endCallback

exports.createClient = -> return new HttpClient()