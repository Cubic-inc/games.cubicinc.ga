local App = require('weblit-app')
local pathJoin = require('luvi').path.join
local Static = require("weblit-static")

App.use(require('weblit-auto-headers'))
App.use(require('weblit-etag-cache'))


App.route({method = "GET", path = "/games/:path:"}, Static(pathJoin(module.dir, "games")))

App.start()