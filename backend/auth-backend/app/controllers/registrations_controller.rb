
class RegistrationsController < ApplicationController
    include AuthTokenConcern
    def create
        user = User.create(
            email: params['user']['email'], 
            password: params['user']['password'],
            auth_token: unique_auth_token
        )

        if user
            session[:user_id] = user.id
            render json: {
                status: :create,
                user: user
            }
        else 
            render json: { status: 500 }
        end 
    end 
end 