$(document).on 'turbolinks:load', ->
  $('.rhyme').on 'click', ->
    $(@).find('.candidate__results').toggleClass('candidate__results--collapsed candidate__results--expanded')
