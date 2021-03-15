module My
  class ClipController < AuthenticatedController
    def create
      Clip.create({ list_id: set_list.id, store_id: params[:store_id] })

      render json: { status: :ok }
    end
    
    def destroy
      Clip.destroy({ user_id: current_user.id, store_id: params[:store_id] })

      render json: { status: :ok }
    end

    private

    def set_list
      Rails.logger.info '目印'
      Rails.logger.info params.to_json
      if params[:list_id].present?
        List.ours(current_user).find(params[:list_id])
      else
        List.default_list(current_user)
      end
    end
  end
end