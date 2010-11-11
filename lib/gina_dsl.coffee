client = require("./client").createClient()

application = undefined

exports.register = (app) ->
  application = app

global.get = (url,headers,callback) ->
  client.get application, url, headers, (res) ->
     callback(res)
     asyncSpecDone()
  asyncSpecWait()
  