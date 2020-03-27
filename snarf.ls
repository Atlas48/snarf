require! https
require! fs

module.exports = (url, location) ->
  ``var _location;
  location =(_location=location)!==null&&_location!==void 0?_location : ``"#{process.cwd!}/#{fs.basename(url)}";
  new Promise (resolve, reject) ->
    f=fs.createWriteStream
    f.on \error reject
    https.get url, (res) ->
      res.on \error, reject
      res.on \success, resolve
      res.pipe f

