module.exports =
  provide: (robot, req, res) ->
    {
      text: req.headers.host
    }
