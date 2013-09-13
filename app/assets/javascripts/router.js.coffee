# For more information see: http://emberjs.com/guides/routing/

EmberBloger.Router.map ()->
  @resource 'about'
  @resource 'posts', ->
    @resource 'post', path: ':post_id'


EmberBloger.PostsRoute = Ember.Route.extend
  model: ->
    posts

EmberBloger.PostRoute = Ember.Route.extend
  model: (params) ->
    posts.findBy 'id', params.post_id

Ember.Handlebars.helper 'format-date', (date) ->
  moment(date).fromNow()

posts = [
  {
    id: '1',
    title: "My First Post",
    author: { name: 'LMM' },
    date: new Date('5-7-13'),
    excerpt: "This is a toy app, playing around with ember.",
    body: "I love the fact the Ember has powerful data-bindings."
  },
  {
    id: '2',
    title: "This is My Second Post",
    author: { name: 'LMM' },
    date: new Date('5-8-13'),
    excerpt: "Ember is proving to be a very powerful front-end framework.",
    body: "Backed by a Rails API server, the two give us a knockout combination to build powerful apps."
  }
]