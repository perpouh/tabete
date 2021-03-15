module My
  class FollowController < AuthenticatedController
    def create
      Follow.create({ follower_id: current_user.id, followee_id: params[:user_id] })

      render json: { status: :ok }
    end
    
    def destroy
      Follow.destroy({ follower_id: current_user.id, followee_id: params[:user_id] })

      render json: { status: :ok }
    end
  end
end