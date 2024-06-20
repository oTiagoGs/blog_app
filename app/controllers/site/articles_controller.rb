class Site::ArticlesController < SiteController
  
  # GET site/articles/id
  def show
    @article = Article.find(params[:id])
  end

end