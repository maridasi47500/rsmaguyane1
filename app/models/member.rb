class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable#, :registerable
         #:recoverable, :rememberable, :validatable
def username=(x)
write_attribute(:login,x)
end
end
