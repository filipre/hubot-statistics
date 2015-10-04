# hubot-statistics

A hubot script that provides statistics about the hubot instance in a json format. You may want to use [http://www.repo-board.io/](http://www.repo-board.io/)

See [`src/statistics.coffee`](src/statistics.coffee) for full documentation.

## Example using [Github Dashboard](http://www.repo-board.io/)

<center>
![example](https://raw.githubusercontent.com/filipre/hubot-statistics/master/example.png)
</center>

#### .dashboard.yml

```
logo: https://hubot.github.com/assets/images/layout/hubot-avatar@2x.png
delay: 5
branch:
  - master
stats:
  - url: http://<ip-address>:8080/hubot/statistics/name
    icon: octicon octicon-hubot
  - url: http://<ip-address>:8080/hubot/statistics/commands
    icon: octicon octicon-terminal
  - url: http://<ip-address>:8080/hubot/statistics/online
    icon: octicon octicon-clock
  - url: http://<ip-address>:8080/hubot/statistics/version
    icon: octicon octicon-tag
  - url: http://<ip-address>:8080/hubot/statistics/adapter
    icon: octicon octicon-plug
```

## Installation

In hubot project repo, run:

`npm install hubot-statistics --save`

Then add **hubot-statistics** to your `external-scripts.json`:

```json
[
  "hubot-statistics"
]
```

## API

#### [/hubot/statistics](src/statistics.coffee)

All statistics in one json file. For example:

```json
{
  "adapter": {
    "text": "slack"
  },
  "commands": {
    "text": 18,
    "commands": [
      "..."
    ]
  }
}
```

#### [/hubot/statistics/:name](src/statistics/)

Simple json with `text` property:

```json
{
  "text": "value of a specific statistic"
}
```
