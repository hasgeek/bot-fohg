# Description:
#   Testing out conversations on Hubot
#
# Dependencies:
#   "hubot-conversation": "^1.1.1"
#
# Author:
#   Karthik Balakrishnan <karthikb351@gmail.com>

Conversation = require('hubot-conversation');
module.exports = (robot) ->

  switchBoard = new Conversation(robot)

  robot.respond /talk/i, (res) ->

    if res.message.room[0] != 'D' # Only respond to DMs
      return

    dialog = switchBoard.startDialog res

    res.reply 'What do you want to talk about? I know a bit about JavaScript and DevOps'

    dialog.addChoice /javascript|js|angular|ninja|jsfoo/, (res2) ->
      res2.reply '''JSFoo is our annual JavaScript conference. This year's theme is on building reliable web apps. Discussions are over at #jsfoo, website is https://jsfoo.in/2017/
You should check out the list of proposals and submit a talk! It's over at https://jsfoo.talkfunnel.com/2017/'''

    dialog.addChoice /devops|rootconf|infra|infrastucture/, (res2) ->
      res2.reply '''Rootconf is our annual conference on devops and infrastructure. This year's theme is on service reliability. Discussions are over at #rootconf, website is https://rootconf.in/2017/
You should check out the list of proposals and submit a talk! It's over at https://rootconf.talkfunnel.com/2017/'''
