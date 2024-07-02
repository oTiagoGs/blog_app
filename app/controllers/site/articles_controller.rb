class Site::ArticlesController < SiteController
  before_action :get_subjects
  # GET site/articles/id
  def show
    @q = Article.ransack(params[:q])
    @article = @q.result._article_(params[:id])
  end

  def subject
    @q = Article.ransack(params[:q])
    @articles = @q.result._subject_(params[:page], params[:subject_id])
  end

  private 

  def get_subjects
    @subjects = Subject.all
  end
end