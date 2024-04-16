class StocksController < ApplicationController
    
    def profile
        @user = User.all
    end

    def new_cashin
        @user = current_user
    end

    def cashin
        @user = current_user
        if @user.update(transaction_params)
          redirect_to profile_path, notice: 'Balance updated successfully'
        else
          render :new_cashin
        end
    end

    private

    def transaction_params
    params.require(:user).permit(:balance)
    end
end
