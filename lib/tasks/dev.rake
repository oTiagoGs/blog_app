namespace :dev do

  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Cadastrando administrador padrão...") { %x(rails dev:add_default_admin) }
      show_spinner("Cadastrando administradores extras...") { %x(rails dev:add_extra_admins)}
      show_spinner("Cadastrando Assuntos padrão...") { %x(rails dev:add_subjects)}
      show_spinner("Cadastrando Artigos para cada assunto...") { %x(rails dev:add_article_to_subject)}

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

  desc "Cadastrando os administradores extra"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
        email: Faker::Internet.email,
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Cadastrando assuntos padrão"
  task add_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)
      
    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end
  end

  desc "Cadastrando Articles para cada assunto"
  task add_article_to_subject: :environment do
    Subject.all.each do |subject|
      rand(1..5).times do |i|
        Article.create!(
          title: Faker::Lorem.sentence,
          description: Faker::Lorem.paragraph,
          content: Faker::Lorem.paragraph_by_chars(number: 350),
          subject: subject,
          admin: Admin.all.sample
        )
      end
    end
  end

  desc "Reseta o contador dos assuntos"
  task reset_counters_subject: :environment do
    show_spinner("Reseta o contador dos assuntos...") do
      Subject.find_each do |subject|
        Subject.reset_counters(subject.id, :article)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
