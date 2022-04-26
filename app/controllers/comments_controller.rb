class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destory]

  def index; end

  def new
    @comment = Comment.new
  end

  def show; end

  def edit; end
  def update   
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.product_id = params[:product_id]
    @current_product = Product.find_by_id(params[:product_id])

    respond_to do |format|
      if @current_product.user_id != current_user.id
        if @comment.save
          format.js
        else
          format.js { render js: 'alert("Error in saving comment\nIt should be atleast 5 in length");' }
          # format.js
          # @comment.errors.any?
          # @comment.errors.each do |key, value|
          # end
        end
      else
        flash.alert = "You can't comment on your own product"

      end
    end
    # redirect_to product_path(@product) if @product.save
  end

  def destroy

    @comment = Comment.find_by_id(params[:id])
    if @comment.user == current_user

      if @comment.destroy

        redirect_to product_path(@comment.product)

      else

        redirect_to product_path(@comment.product), notice: 'Error!'
        # format.js { render js: 'alert("Error in deletion");' }

      end
    else

      redirect_to product_path(@comment.product)
      flash[:message] = "You can only  delete your own comment!"
    end

    # respond_to do |format|
    #   # format.html { redirect_to viewproduct_path, notice: 'Comment was successfully deleted.' }
    #   format.json { head :no_content }
    #   format.js
    # end
  end

  private

  def set_comment
    @comment = Comment.find_by_id(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment_text)
  end
end
