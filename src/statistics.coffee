# Description
#   A hubot script that provides statistics about the hubot instance in a json format
#
# Commands:
#   hubot statistics [<name>] - Get the text property of a specific statistic (or all)
#
# Notes:
#   You may want to use http://www.repo-board.io/
#
# Author:
#   René Filip <rene.filip@sap.com>

requireDir = require 'require-dir'
statistics = requireDir './statistics'

module.exports = (robot) ->

  for name, statistic of statistics

    # Execute Start routines
    if statistic.onStart?
      statistic.onStart(robot)

    # Provide specific data
    if statistic.provide?

      # Online as JSON
      robot.router.get '/hubot/statistics/' + name, do (statistic) ->
        (req, res) ->
          res.json statistic.provide(robot)

      # On demand
      regex = new RegExp('statistics ' + name, 'i')
      robot.respond regex, do (statistic) ->
        (msg) ->
          data = statistic.provide(robot)
          response = "Text attribute not set."
          if data.hasOwnProperty('text')
            response = data.text
          msg.send response.toString()


  # Provide all data in one json file
  robot.router.get '/hubot/statistics', (req, res) ->
    stats = {}
    for name, statistic of statistics
      if statistic.provide?
        stats[name] = statistic.provide(robot)
    res.json stats

  # Or everything in the chat
  robot.respond /statistics$/i, (msg) ->
    reply = "All statistics:"
    for name, statistic of statistics
      if statistic.provide?
        data = statistic.provide(robot)
        if data.hasOwnProperty('text')
          reply += "\n#{name}: #{data.text}"
    msg.send reply
