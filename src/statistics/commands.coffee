module.exports =
  provide: (robot) ->
    {
      text: robot.commands.length
      commands: robot.commands
    }
