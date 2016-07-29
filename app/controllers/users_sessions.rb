class Bookmark_manager < Sinatra::Base
  get '/users/login' do
    erb(:'users/login')
  end

  post '/users/logout' do
    flash[:error] = ["Goodbye, #{current_user.email}"]
    session[:user_id] = nil
    redirect '/links'
  end

  post '/users/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/links'
    else
      flash.now[:error] = ["Incorrect email/password combination"]
      erb(:'users/login')
    end
  end
end
