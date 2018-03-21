class Api::V1::AuthController < ApplicationController

  def login
   begin
     user = login_user(params[:username], params[:password])
     render json: {
       id: user.id,
       username: user.username,
       token: encode_token({'user_id': user.id})
     }
   rescue AuthError => e
     render json: { error: e.msg }, status: 401
   end
  end

  def currentUser
    user = current_user
   if user
     render json: { id: user.id, username: user.username }
   else
     render json: nil
   end
  end

def signup
  user = User.new(user_params)
  if user.save
    begin
      user = login_user(user_params[:username], user_params[:password])
      render json: {
        id: user.id,
        username: user.username,
        token: encode_token({'user_id': user.id})
      }
    rescue AuthError => e
      render json: { error: "Invalid Passwords"}, status: 401
    end
  else
    render json: { error: "Need all info correct to sign up" }
  end

end

private


def user_params
  params.require(:user).permit(:username, :password, :password_confirmation)
end


end
