class UsersController < ApplicationController
    def create                                      #/signup
        newUser = User.create(user_params)                     
        if newUser.valid?                                           #if create user worked,
            Chip.create(user: newUser, amount: 1000);
            payload = {user_id: newUser.id}                         #assign payload as the user's id 
            token = JWT.encode(payload, 'wework', 'HS256')          #create a token 
            render json: {token: token}                             #give token to JSON browser 
        else 
            render json: {errors: user.errors.full_messages}, status: 422   #give error if doesnt work 
        end 
    end 

    def profile                                                     #/profile 
        token = request.headers["Authorization"]                    #find token in the headers 
        decoded_token = JWT.decode(token, "wework", true, {algorithm: "HS256"})         #decode the token 
        foundUserToken = decoded_token[0]["user_id"]                                    #get user_id from token 
        user = User.find(foundUserToken)                                                #find user from user_id 
        render json: user                                                               #give user as JSON to browser 
    end 

    private 
    def user_params 
        params.permit(:name, :password)
    end 
end
