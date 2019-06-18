local cjson = require "cjson"
cjson.encode_sparse_array(true)

pg = require(arg[1])

print(cjson.encode(pg))
