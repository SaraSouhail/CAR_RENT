class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true

  has_one :client
  has_one :owner
  has_one_attached :profile_photo

  after_create :create_by_role

  def create_by_role
    if self.role == 'client'
      Client.create(user: self)
    else
      Owner.create(user: self)
    end
  end
end
