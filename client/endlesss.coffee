incrementLimit = (inc = ITEMS_INCREMENT) ->
  newLimit = Session.get('limit') + inc
  Session.set 'limit', newLimit
  return

Template.itemsTemplate.created = ->
  Session.setDefault 'limit', ITEMS_INCREMENT

  Deps.autorun ->
    Meteor.subscribe 'getItems', Session.get('limit')
    return
  return

Template.itemsTemplate.rendered = ->
  # Triggered on scroll
  $(window).scroll ->
    if $(window).scrollTop() + $(window).height() > $(document).height() - 100
      incrementLimit()
    return
  return

Template.itemsTemplate.events 'click .btn': (evt) ->
  incrementLimit()
  return
Template.itemsTemplate.helpers items: ->
  Items.find {}, limit: Session.get('limit')