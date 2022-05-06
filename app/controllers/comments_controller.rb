# frozen_string_literal: true

# CommentsController
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destory]

  def index; end

  def new
    @comment = Comment.new
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        redirect_to product_path(@comment.product)
        format.js
      else
        format.js { render js: 'alert("Error in updating comment\nIt should be atleast 5 in length");' }
      end
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.product_id = params[:product_id]

    respond_to do |format|
      if @comment.save
        format.js
      else
        format.js { render js: 'alert("Error in saving comment\nIt should be atleast 5 in length");' }
      end
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])

    if @comment.destroy

      redirect_to product_path(@comment.product)
    else
      redirect_to product_path(@comment.product), notice: 'Error!'

    end
  end

  private

  def set_comment
    @comment = Comment.find_by_id(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment_text)
  end
end
