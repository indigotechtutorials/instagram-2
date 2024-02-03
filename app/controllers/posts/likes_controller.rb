module Posts
  class LikesController < ApplicationController
    include ActionView::RecordIdentifier
    before_action :set_post

    def create
      current_user.likes.create(post_id: @post.id)
      render turbo_stream: turbo_stream.update(dom_id(@post, :like), partial: "posts/like", locals: { user: current_user, post: @post })
    end

    def destroy
      current_user.likes.where(post_id: @post.id).destroy_all
      render turbo_stream: turbo_stream.update(dom_id(@post, :like), partial: "posts/like", locals: { user: current_user, post: @post })
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end

  end
end