
class AuthController < ApplicationController 

    def create                                                      #/login
        found = User.find_by(name: params[:name])                   #find user by username 
        isAuthenticated = found.authenticate(params[:password])     #authenticate user with the given password from params 
        if isAuthenticated                                          #if authenticated, 
            payload = {user_id: found.id}                           #assign payload as user's id 
            token = JWT.encode(payload, 'wework', 'HS256')          #create a token 
            render json: {token: token}                             #give token in JSON to browser 
        else 
            render json: 
            {
                errors: ["Wrong Username or Password "],
                status: 422
            }
        end 
    end 
end 