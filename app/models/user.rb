class User < ActiveRecord::Base

  scope :find_by_something, lambda { |parameter|
    # Arbitrary self join just to demo something.
    joins(%Q{
      INNER JOIN users AS users_2 ON users.id = users_2.id
    }).where(%Q{
      users.email LIKE :parameter
    }, :parameter => parameter)
  }

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
