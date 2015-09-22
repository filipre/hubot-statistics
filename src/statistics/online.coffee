moment = require 'moment'

module.exports =

  onStart: (robot) ->
    robot.brain.data.statistics =
        online: moment().format 'MMMM Do YYYY, h:mm a'

  provide: (robot) ->
    {
      text: "Online since #{robot.brain.data.statistics.online}"
      date: robot.brain.data.statistics.online
    }
