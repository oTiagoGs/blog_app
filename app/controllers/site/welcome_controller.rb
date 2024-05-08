class Site::WelcomeController < SiteController
  before_action :get_subjects, only: [:index]

  def index
    @articles = Article.last_articles(params[:page])
  end

  private 

  def get_subjects
    @subjects = Subject.all
  end
end
