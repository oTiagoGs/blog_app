class Site::ArticlesController < SiteController
  
  # GET site/articles/id
  def show
    @article = Article._article_(params[:id])
  end

  def subject
    @articles = Article._subject_(params[:page], params[:subject_id])
  end
end