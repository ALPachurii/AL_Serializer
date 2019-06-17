local cjson = require "cjson"

require(arg[1])

print(cjson.encode(pg[arg[2]]))
