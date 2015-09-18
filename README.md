# hubot-statistics

A hubot script that provides statistics about the hubot instance in a json format

See [`src/statistics.coffee`](src/statistics.coffee) for full documentation.

## API

#### [/hubot/statistics](src/statistics.coffee)

All statistics in one json file. For example:

*not provided yet*

```json
{
  "name": "Hubot's name",
  "version": "Hubot's version from package.json",
  "commands": "count of commands",
  "adapter": "Adapter used for Hubot",
  "...": "..."
}
```

#### [/hubot/statistics/:name](src/statistics/)

Simple json with `text` property:

```json
{
  "text": "value of a specific statistic"
}
```

<!--

## Installation

In hubot project repo, run:

`npm install hubot-statistics --save`

Then add **hubot-statistics** to your `external-scripts.json`:

```json
[
  "hubot-statistics"
]
```

## Sample Interaction

```
user1>> hubot hello
hubot>> hello!
```

-->
