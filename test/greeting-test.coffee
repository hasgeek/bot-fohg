Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../scripts/greeting.coffee')

describe 'Greeting: In the #general channel', ->
  beforeEach ->
    @generalChannel = helper.createRoom({ name: 'C04TX4KPC' })

  afterEach ->
    @generalChannel.destroy()


  it 'says hello to new visitors', ->
    @generalChannel.enter('alice').then =>
      expect(@generalChannel.messages).to.eql [
        ['hubot', '''Hello :wave:!
Welcome to Friends of HasGeek. This is where the HasGeek community hangs out.
First thing you probably want to do is introduce yourself over at #icepick (It's also a good place to see what kinds of people are on here).

Also be sure to update your profile at https://friendsofhasgeek.slack.com/account/profile. A short bio mentioning where you work/what you do/etc would be super.

Remember to be civil :) Get in touch with @karthik or @raghu if you need anything, or drop a mail to info@hasgeek.com.''']
      ]

describe 'Greeting: In the #test-general channel', ->
  beforeEach ->
    @generalChannel = helper.createRoom({ name: 'C40JWUC2H' })

  afterEach ->
    @generalChannel.destroy()


  it 'says hello to new visitors', ->
    @generalChannel.enter('alice').then =>
      expect(@generalChannel.messages).to.eql [
        ['hubot', '''Hello :wave:!
Welcome to Friends of HasGeek. This is where the HasGeek community hangs out.
First thing you probably want to do is introduce yourself over at #icepick (It's also a good place to see what kinds of people are on here).

Also be sure to update your profile at https://friendsofhasgeek.slack.com/account/profile. A short bio mentioning where you work/what you do/etc would be super.

Remember to be civil :) Get in touch with @karthik or @raghu if you need anything, or drop a mail to info@hasgeek.com.''']
      ]

describe 'Greeting: In other channels', ->
  beforeEach ->
    @otherChannel = helper.createRoom()

  afterEach ->
    @otherChannel.destroy()

  it 'don\'t say hello to new visitors', ->
    @otherChannel.enter('alice').then =>
      expect(@otherChannel.messages).to.eql [
      ]
