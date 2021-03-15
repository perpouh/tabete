module My
  class TimelineController < AuthenticatedController
    def index
      @articles = current_user.followees.map{ |v| v.articles }
    end
  end
end