moment = require 'moment'

module.exports =

  onStart: (robot) ->
    robot.brain.on 'loaded', =>
      robot.brain.data.statistics ?= {}
      robot.brain.data.statistics.online = moment().format 'MMMM Do YYYY, h:mm a'

  provide: (robot) ->
    value = "No date set. Brain not loaded."
    if robot.brain.data.statistics? && robot.brain.data.statistics.online?
      value = robot.brain.data.statistics.online

    {
      text: "Online since #{value}"
      date: value
    }
