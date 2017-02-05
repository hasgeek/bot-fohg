# Description:
#   Greets new users with a welcome message and useful pointers
#
# Author:
#   Karthik Balakrishnan <karthikb351@gmail.com>

module.exports = (robot) ->
    robot.enter (res) ->
      if res.message.room == "C04TX4KPC" || res.message.room == "C40JWUC2H" # ID of the #general and #test-general channe
        #user = robot.adapter.client.rtm.dataStore.getUserById res.message.user.id
        robot.messageRoom res.message.user.id, '''Hello :wave:!
Welcome to Friends of HasGeek. This is where the HasGeek community hangs out.
First thing you probably want to do is introduce yourself over at #icepick (It's also a good place to see what kinds of people are on here).

Also remember to update your profile at https://friendsofhasgeek.slack.com/account/profile. A short bio mentioning where you work/what you do/etc would be super.

Remember to be civil :) Get in touch with @karthik or @raghu if you need anything, or drop a mail to info@hasgeek.com'''
