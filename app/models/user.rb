class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :confirmable, :database_authenticatable, :registerable,
  # :recoverable, :validatable, :trackable, :timeoutable and :omniauthable
  devise :trackable, :rememberable, :omniauthable


  def self.from_omniauth(auth)
    ## This will get around strong parameters
    params = ActionController::Parameters.new(user: auth.slice(:provider, :uid))
    permitted = params.require(:user).permit(:provider, :uid)

    where(permitted).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
    end
  end#self.from_omniauth

end
