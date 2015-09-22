stringHash = require 'string-hash'

module.exports =

  onStart: (robot) ->

    robot.brain.on 'loaded', =>
      robot.brain.data.statistics ?= {}
      robot.brain.data.statistics.cmdlogger ?= {}

    robot.respond /.*/i, (msg) ->
      # check listeners for the right regex
      for regex, i in robot.listeners
        if msg.message.text.match regex.regex
          key = stringHash regex.regex.toString()

          if robot.brain.data.statistics.cmdlogger.hasOwnProperty(key)
            robot.brain.data.statistics.cmdlogger[key].count++
          else
            robot.brain.data.statistics.cmdlogger[key] =
              regex: regex.regex.toString()
              count: 1

    robot.respond /statistics cmdlogger reset/i, (msg) ->
      robot.brain.data.statistics.cmdlogger = {}
      msg.send "All command stats reset"


  provide: (robot) ->
    {
      text: "#{Object.keys(robot.brain.data.statistics.cmdlogger).length} commands used so far!"
      data: robot.brain.data.statistics.cmdlogger
    }