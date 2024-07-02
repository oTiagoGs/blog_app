class Site::WelcomeController < SiteController
  before_action :get_subjects, only: [:index]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result.last_articles(params[:page])
  end

  private 

  def get_subjects
    @subjects = Subject.all
  end
end
