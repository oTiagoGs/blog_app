class AdminsBackoffice::SubjectsController < AdminsController
    before_action :set_subject, only: [:edit, :update, :destroy]


    def index
        @subjects = Subject.all.page(params[:page])
    end

    def new
        @subject = Subject.new
    end

    def create
        @subject = Subject.new(subject_params)
        if @subject.save
            redirect_to admins_backoffice_subjects_path, notice: "Assunto cadastrado com sucesso!!"
        else
            render :new
        end
    end

    def edit  
    end

    def update
        if @subject.update(subject_params)
            redirect_to admins_backoffice_subjects_path, notice: "Assunto atualizado com sucesso!!"
        else
            render :edit
        end
    end

    def destroy
        if @subject.destroy
            redirect_to admins_backoffice_subjects_path, notice: "Assunto excluido com sucesso!!"
        else
            redirect_to :index
        end
    end

    private

    def subject_params
        params.require(:subject).permit(:description)
    end

    def set_subject
        @subject = Subject.find(params[:id])
    end
end
