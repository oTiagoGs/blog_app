module SiteHelper
    def msg_jumbotron
        if params[:q]
            "Resultado para a pesquisa: #{params[:q].values}"
        elsif params[:action] == "index"
            "Artigos mais recentes"
        else params[:action] == "subject"
            "Artigos do assunto: \"#{params[:subject]}\""
        end
    end
end
