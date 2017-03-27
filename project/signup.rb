require 'sinatra'

get('/') do
  erb :signup
end

get('/:name') do
  @name = params[:name].capitalize
  erb :signup
end

get('/:goodbye/:name') do
  @goodbye = params[:goodbye].capitalize
  @name = params[:name].capitalize
  erb :signup
end

get('/:goodbye/:name/:day') do
  @goodbye = params[:goodbye].capitalize
  @name = params[:name].capitalize
  @day = params[:day]
  erb :signup
end

post('/signup') do
  puts params[:name]
  puts params[:email]
  "Thanks for signing up! You will receive a confirmation email shortly."

  require 'pony'

  Pony.options = {
    :via => 'smtp',
    :via_options => {
      :address => 'smtp.mailgun.org',
      :port => '587',
      :enable_starttls_auto => true,
      :authentication => :plain,
      # This is the Default SMTP Login from earlier:
      :user_name => 'postmaster@sandbox562c52e848864505a536ee6b9d7a6818.mailgun.org',
      # This is your Default Password:
      :password => '7d6d357763f03b8d25fa59160dda165a'
    }
  }

  message = {
    :from => 'sophie-humphrey@hotmail.co.uk',
    :to => "#{params[:name]} <#{params[:email]}>",
    :subject => 'Welcome!',
    :body => 'Thanks for signing up to our app! Read on to see all the cool features it can offer you...'
  }

  Pony.mail(message)
"Thanks for signing up! You will receive a confirmation email shortly."
end
