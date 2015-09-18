# Description
#   A hubot script that provides statistics about the hubot instance in a json format
#
# Notes:
#   You may want to use http://www.repo-board.io/
#
# Author:
#   René Filip <rene.filip@sap.com>

moment = require 'moment'

getName = (robot) ->
  return robot.name

getAdapter = (robot) ->
  return robot.adapterName

getVersion = (robot) ->
  return robot.version

getCommands = (robot) ->
  return robot.commands.length

saveCurrentTime = (robot) ->
  robot.brain.data.statistics = {
    online: moment().format 'MMMM Do YYYY, h:mm a'
  }

getOnline = (robot) ->
  return "Online since #{robot.brain.data.statistics.online}"

module.exports = (robot) ->

  # set current time if script (and brain) have started
  saveCurrentTime robot

  # Router:

  robot.router.get '/hubot/statistics', (req, res) ->
    res.json 'text': 'not supported yet'

  robot.router.get '/hubot/statistics/name', (req, res) ->
    res.json 'text': getName robot

  robot.router.get '/hubot/statistics/adapter', (req, res) ->
    res.json 'text': getAdapter robot

  robot.router.get '/hubot/statistics/version', (req, res) ->
    res.json 'text': getVersion robot

  robot.router.get '/hubot/statistics/commands', (req, res) ->
    res.json 'text': getCommands robot

  robot.router.get '/hubot/statistics/online', (req, res) ->
    res.json 'text': getOnline robot
