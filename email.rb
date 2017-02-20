require 'pony'

Pony.options = {
  :via => 'smtp',
  :via_options => {
    :address => 'smtp.mailgun.org',
    :port => '587',
    :enable_starttls_auto => true,
    :authentication => :plain,
    # This is the Default SMTP Login from earlier:
    :user_name => 'postmaster@your-sandbox-domain.mailgun.org', # This is your Default Password:
    :password => 'your password'
  }
}

message = {
  :from => 'hello@example.com',
  :to => 'Recipient Name Goes Here <some.email@example.com>',
  :subject => 'Welcome!',
  :body => 'Thanks for signing up to our awesome newsletter!'
}

Pony.mail(message)
