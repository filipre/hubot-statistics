# hubot-statistics

A hubot script that provides statistics about the hubot instance in a json format. You may want to use [http://www.repo-board.io/](http://www.repo-board.io/)

See [`src/statistics.coffee`](src/statistics.coffee) for full documentation.

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

## Installation

In hubot project repo, run:

`npm install hubot-statistics --save`

Then add **hubot-statistics** to your `external-scripts.json`:

```json
[
  "hubot-statistics"
]
```
