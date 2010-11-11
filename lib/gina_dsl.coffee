client = require("./client").createClient()

exports.get = (server, url,headers,callback) ->
  client.get server, url, headers, (res) ->
     callback(res)
     asyncSpecDone()
  asyncSpecWait()