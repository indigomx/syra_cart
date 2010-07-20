class PasswordResetsController < Spree::BaseController
  before_filter :require_no_user
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]

  def new
    render
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      self.notice = "Las instrucciones para cambiar su contrase&ntilde; ser&aacute;n enviadas por mail"
      redirect_to root_url
    else
      flash[:error] = "No se encontr&oacute; el usuario"
      render :action => :new
    end
  end

  def edit
    render
  end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      self.notice = "Contrase&ntilde;a actualizada"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  private
    def load_user_using_perishable_token
      @user = User.find_using_perishable_token(params[:id])
      unless @user
        self.notice = "Error al actualizar la contrase&ntilde;a"
        redirect_to root_url
      end
    end

    def accurate_title
      I18n.t(:forgot_password)
    end

end
