# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  findLastConnectionId = ->
    connectionId = 0
    $('.user').each (index, user) ->
      userConnectionId = parseInt($(user).data('connection-id'))
      connectionId = if connectionId > userConnectionId then connectionId else userConnectionId
    connectionId

  callback = ->
    if $('.message:last-child').length
      lastMessageId = $('.message:last-child').attr('id')
    else
      lastMessageId = 0
    lastConnectionId = findLastConnectionId()
    $.getScript "/rooms/1/events.js?last_message=" + lastMessageId + "&last_connection=" + lastConnectionId
    setTimeout callback, 5000
  callback()
