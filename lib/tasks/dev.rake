namespace :dev do

  DEFAULT_PASSWORD = 123456

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Cadastrando o administrador padrão...") { %x(rails dev:add_default_admin) }

    else
      "Você não está no ambiente de desenvolvimento!"
    end
  end

  desc "Cadastrando o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
