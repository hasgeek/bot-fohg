Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/conversation.coffee')

describe 'Conversation: In the #general channel', ->
  beforeEach ->
    @generalChannel = helper.createRoom({ name: 'C40JWUC2H' })

  afterEach ->
    @generalChannel.destroy()

  it 'Don\'t respond to talk', ->
    @generalChannel.user.say('alice', '@hubot talk').then =>
      expect(@generalChannel.messages).to.eql [
        ['alice', '@hubot talk']
      ]

describe 'Conversation: In other channels', ->
  beforeEach ->
    @otherChannel = helper.createRoom()

  afterEach ->
    @otherChannel.destroy()

  it 'Don\'t respond to talk', ->
    @otherChannel.user.say('alice', '@hubot talk').then =>
      expect(@otherChannel.messages).to.eql [
        ['alice', '@hubot talk']
      ]

describe 'Conversation: In DMs, where I can talk', ->
  beforeEach ->
    @otherChannel = helper.createRoom({ name: 'DXXXXXX' })
    @otherChannel.user.say('alice', '@hubot talk')

  afterEach ->
    @otherChannel.destroy()

  it 'respond to mention of javascript', ->
    @otherChannel.user.say('alice', '@hubot about javascript').then =>
      expect(@otherChannel.messages).to.eql [
        ['alice', '@hubot talk'],
        ['hubot', '@alice What do you want to talk about? I know a bit about JavaScript and DevOps']
        ['alice', '@hubot about javascript'],
        ['hubot', '''@alice JSFoo is our annual JavaScript conference. This year's theme is on building reliable web apps. Discussions are over at #jsfoo, website is https://jsfoo.in/2017/
You should check out the list of proposals and submit a talk! It's over at https://jsfoo.talkfunnel.com/2017/''']
      ]

  it 'respond to mention of js', ->
    @otherChannel.user.say('alice', '@hubot I think js is fun').then =>
      expect(@otherChannel.messages).to.eql [
        ['alice', '@hubot talk'],
        ['hubot', '@alice What do you want to talk about? I know a bit about JavaScript and DevOps']
        ['alice', '@hubot I think js is fun'],
        ['hubot', '''@alice JSFoo is our annual JavaScript conference. This year's theme is on building reliable web apps. Discussions are over at #jsfoo, website is https://jsfoo.in/2017/
You should check out the list of proposals and submit a talk! It's over at https://jsfoo.talkfunnel.com/2017/''']
      ]

  it 'respond to mention of ninja', ->
    @otherChannel.user.say('alice', '@hubot But I am a ninja').then =>
      expect(@otherChannel.messages).to.eql [
        ['alice', '@hubot talk'],
        ['hubot', '@alice What do you want to talk about? I know a bit about JavaScript and DevOps']
        ['alice', '@hubot But I am a ninja'],
        ['hubot', '''@alice JSFoo is our annual JavaScript conference. This year's theme is on building reliable web apps. Discussions are over at #jsfoo, website is https://jsfoo.in/2017/
You should check out the list of proposals and submit a talk! It's over at https://jsfoo.talkfunnel.com/2017/''']
      ]

  it 'respond to mention of infra', ->
    @otherChannel.user.say('alice', '@hubot I\'m an infra person').then =>
      expect(@otherChannel.messages).to.eql [
        ['alice', '@hubot talk'],
        ['hubot', '@alice What do you want to talk about? I know a bit about JavaScript and DevOps']
        ['alice', '@hubot I\'m an infra person'],
        ['hubot', '''@alice Rootconf is our annual conference on devops and infrastructure. This year's theme is on service reliability. Discussions are over at #rootconf, website is https://rootconf.in/2017/
You should check out the list of proposals and submit a talk! It's over at https://rootconf.talkfunnel.com/2017/''']
      ]
