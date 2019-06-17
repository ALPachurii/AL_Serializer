local cjson = require "cjson"

pg = require(arg[1])

print(cjson.encode(pg))
