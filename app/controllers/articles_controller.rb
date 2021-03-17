class ArticlesController < AuthenticatedController
  before_action :set_article, only: [:update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @store = Store.find_or_create_by(article_attributes[:store]) do |s|
      s.templature = true
    end
    @article = Article.new({ body: article_attributes[:body], store_id: @store.id })
    article_attributes[:article_images].each do |image|
      @article.store_images.build(image)
    end
    @article.validate!
    @article.save
  end

  def update
    @article.body = article_attributes[:body]
    # TODO: 洗い替えは気に食わない
    @article.article_images.each(&:destroy)
    article_attributes[:article_images].each do |image|
      @article.store_images.build(image)
    end
    @article.validate!
    @article.save
  end

  def destroy
    # TODO: 執行猶予を設けるか？
    @article.destroy
  end

  private

  def set_article
    @article = Article.mine.find(params[:id])
  end

  def article_attributes
    params.require(:article).permit(:body, store: [:name, :address], article_images: [:image])
  end
end
