module My
  class TimelineController < AuthenticatedController
    def index
      @articles = current_user.followees.map(&:articles)
    end
  end
end