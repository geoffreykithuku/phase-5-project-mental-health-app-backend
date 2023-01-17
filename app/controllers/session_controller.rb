class SessionController < ApplicationController
    skip_before_action :authorized_account, only: [:login]

    def create
       user = User.find_by(email:params[:email])
       if user&.authenticate(params[:password])
           session[:id] = user.id
           render json: user, status: :created
       else
           render json: {error: "Invalid Password or Email"}, status: :unauthorized
       end
   end
 
   def authorized
       render json: loggedIn_user
   end
 
   def destroy
       session.delete :user_id
       head :no_content  
   end
end
