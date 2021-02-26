class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @existe = User.exists?(email: user_params[:email])

    if @existe   # correo esta registrado
      render json: { error: 'este correo ya esta registrado en nuestra plataforma' }
    else         # correo es nuevo
      @user = User.create(user_params)
      if @user.valid? &&
         token = encode_token({ user_id: @user.id })
        render json: { user: @user, token: token }
      else
        render json: { error: 'Invalid username or password' }
      end
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])   # valida la passsword
      token = encode_token({ user_id: @user.id })       # codifica a token
      render json: { user: @user, token: token }        # entrega token
    else
      render json: { error: 'correo o contrana esta incorrecto' }
    end
  end

  # AUTO LOGIN , aun no lo e usado
  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password, :email)
  end
end
