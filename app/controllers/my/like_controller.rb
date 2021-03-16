module My
  class LikeController < AuthenticatedController
    def create
      Like.create({ user_id: current_user.id, article_id: params[:article_id] })

      render json: { status: :ok }
    end

    def destroy
      Like.destroy({ user_id: current_user.id, article_id: params[:article_id] })

      render json: { status: :ok }
    end
  end
end