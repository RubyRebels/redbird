class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :trackable, :timeoutable and :omniauthable
  devise :lockable, :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
