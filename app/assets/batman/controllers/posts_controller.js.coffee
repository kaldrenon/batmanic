class Batmanic.PostsController extends Batmanic.ApplicationController
  routingKey: 'posts'

  @beforeAction 'fetchPost', only: ['show','edit']

  index: (params) ->
    @set('posts', Batmanic.Post.get('all'))

  show: (params) ->
    @set('comment', new Batmanic.Comment(post_id: params.id))

  edit: (params) ->

  new: (params) ->
    @set('post', new Batmanic.Post)

  create: (params) ->
    @post.save (err, post) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @redirect post

  update: (params) ->
    @post.save (err, post) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @redirect post

  destroy: (node, event, context) ->
    post = if context.get('post') then context.get('post') else @post
    post.destroy (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @redirect '/posts'

  fetchPost: (params) ->
    Batmanic.Post.find params.id, @errorHandler (post) =>
      @set('post', post)

  createComment: ->
    @comment.save =>
      @post.get('comments').add @comment
      @redirect "/posts/#{@post.get('id')}"

  destroyComment: (node, event, context) ->
    comment = context.get('comment')
    comment.destroy (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        @post.get('comments').remove comment
        @redirect "/posts/#{@post.get('id')}"
