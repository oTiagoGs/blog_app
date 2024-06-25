class Site::ArticlesController < SiteController
  before_action :get_subjects
  # GET site/articles/id
  def show
    @article = Article._article_(params[:id])
  end

  def subject
    @articles = Article._subject_(params[:page], params[:subject_id])
  end

  private 

  def get_subjects
    @subjects = Subject.all
  end
end