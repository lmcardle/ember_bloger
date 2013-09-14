EmberBloger.Router.map ()->
  @resource 'about'
  @resource 'posts', ->
    @resource 'post', path: ':post_id'

Ember.Handlebars.helper 'format-date', (date) ->
  moment(date).fromNow()

showdown = new Showdown.converter()

Ember.Handlebars.helper 'format-markdown', (input) ->
  new Handlebars.SafeString(showdown.makeHtml(input))
