# Description
#   A hubot script that provides statistics about the hubot instance in a json format
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
      robot.router.get '/hubot/statistics/' + name, do (statistic) ->
        (req, res) ->
          res.json statistic.provide(robot)

  # Provide all data in one json file
  robot.router.get '/hubot/statistics', (req, res) ->
    stats = {}
    for name, statistic of statistics
      if statistic.provide?
        stats[name] = statistic.provide(robot)
    res.json stats
