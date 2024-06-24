module SiteHelper
    def msg_jumbotron
        case params[:action]
        when 'index'
            "Artigos mais recentes"
        when 'subject'
            "Artigos do assunto: \"#{params[:subject]}\""
        end
    end
end
