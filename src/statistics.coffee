# Description
#   A hubot script that provides statistics about the hubot instance in a json format
#
# Notes:
#   You may want to use http://www.repo-board.io/
#
# Author:
#   René Filip <rene.filip@sap.com>

getName = (robot) ->
  return robot.name

getAdapter = (robot) ->
  return robot.adapterName

getVersion = (robot) ->
  return robot.version

getCommands = (robot) ->
  return robot.commands.length

module.exports = (robot) ->

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
