class UserService
  def initialize(user)
    @user = user
  end

  def create(params)
    @user.assign_attributes(params)
    @user.skip_confirmation!
    if @user.save
      return true
    else
      return false
    end
  end

  def update(params)
    @user.skip_reconfirmation!
    if @user.update(params)
      if params[:is_approved] == '1'
        ApprovedMailer.with(user: @user, user_email: @user.email).is_approved(@user.email).deliver_now
      end
      return true
    else
      return false
    end
  end
end
