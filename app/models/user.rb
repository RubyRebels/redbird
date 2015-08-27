class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :confirmable, :database_authenticatable, :registerable,
  # :recoverable, :validatable, :trackable, :timeoutable and :omniauthable
  devise :trackable, :rememberable
end
