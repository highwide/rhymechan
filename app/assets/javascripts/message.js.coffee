$(document).on 'turbolinks:load', ->
  $('.rhyme__phrase').on 'click', ->
    $(@).next().toggle()
