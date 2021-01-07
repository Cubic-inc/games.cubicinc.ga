local App = require('weblit-app')
local pathJoin = require('luvi').path.join
local Static = require("weblit-static")

App.use(require('weblit-auto-headers'))
App.use(require('weblit-etag-cache'))

App.bind({
    host = "0.0.0.0",
    port = 8080
})

  
App.bind({
    host = "0.0.0.0",
    port = 8443
})


App.route({method = "GET", path = "/games/:path:"}, Static(pathJoin(module.dir, "games")))

App.route({method = "GET", path = "/"}, function (req, res, go)
    res.code = 200
    res.body = "This page is under construction"
    res.headers["Content-Type"] = "text/html"
end)

App.start()