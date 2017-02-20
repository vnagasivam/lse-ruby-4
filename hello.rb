require 'pony'
require 'sinatra'

get '/' do
  erb :hello
end

get '/:name' do
  @name = params[:name].capitalize
  # "Hello #{@name}"
  erb :hello
end

post('/signup') do
  Pony.options = {
    :via => 'smtp',
    :via_options => {
      :address => 'smtp.mailgun.org',
      :port => '587',
      :enable_starttls_auto => true,
      :authentication => :plain,
      # This is the Default SMTP Login from earlier:
      :user_name => ENV['MAILGUN_USERNAME'], # This is your Default Password:
      :password => 'your password'
    }
  }

  message = {
    :from => 'hello@example.com',
    :to => "#{params[:name]} <#{params[:email]}>",
    :subject => 'Welcome!',
    :body => 'Thanks for signing up to our awesome newsletter!'
  }

  Pony.mail(message)

  puts params[:name]
  puts params[:email]
  "All OK"
end
