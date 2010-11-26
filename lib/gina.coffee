client = require("./client").createClient()

application = undefined

exports.register = (app) ->
  application = app

global.get = (url,headers,callback) ->
  client.get application, url, headers, (res) ->
     callback(res)
     asyncSpecDone()
  asyncSpecWait()
  
global.post = (url, headers, callback) ->
  client.post application, url, headers, (res) ->
     callback(res)
     asyncSpecDone()
  asyncSpecWait()
  
global.delete_ = (url, headers, callback) ->
  client.delete_ application, url, headers, (res) ->
     callback(res)
     asyncSpecDone()
  asyncSpecWait()

  