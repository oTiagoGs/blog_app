class AdminsBackoffice::ArticlesController < AdminsController
    before_action :set_article, only: [:edit, :update, :destroy]
    before_action :get_subjects, only: [:new , :create, :edit]

    def index
        @articles = Article.includes(:admin, :subject)
                           .order("id desc")
                           .page(params[:page])
    end

    def new
        @article = current_admin.article.build
    end

    def create
        @article = current_admin.article.new(article_params)
        if @article.save
            redirect_to admins_backoffice_articles_path , notice: "Artigo criado com sucesso"
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @article.update(article_params)
            redirect_to admins_backoffice_articles_path , notice: "Artigo atualizado com sucesso!!"
        else
            render :edit
        end
    end

    def destroy
        if @article.destroy
            redirect_to admins_backoffice_articles_path , notice: "Artigo excluido com sucesso!!"
        else
            render :index
        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :description, :url_image, :content, :recommended, :subject_id, :admin_id)
    end

    def set_article
        @article = Article.find(params[:id])
    end

    def get_subjects
        @subjects = Subject.all
    end
end
