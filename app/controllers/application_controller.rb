class ApplicationController < ActionController::API
    include ActionController::Cookies

    # before_action :authorize

    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private 

    # All error methods are stored here 

    def invalid_record invalid 
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity 
    end 
 
    def record_not_found 
        render json: { error: record }, status: :not_found 
    end

    # Authorize method that will require a user to login before accessing anything else 
    # sets the user as a variable that can be accessed in any other controller 
    # since they all inherit from the ApplicationController 

    def authorize
        @user = User.find_by(id: session[:user_id])
        render json: { errors: ['Unauthorized user']}, status: :unauthorized unless @user 
    end
     
end
