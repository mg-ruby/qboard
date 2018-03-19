$(document).on 'turbolinks:load', ->
  if $(".textarea").length > 0
    simplemde = new SimpleMDE({ element: $(".textarea")[0] })