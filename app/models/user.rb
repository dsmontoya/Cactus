class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :forms
  belongs_to :team


  # Validations
  validates :email, presence: true, length: { maximum: 150}
  validates :school, length: { maximum: 150 }
  validates :facebook, length: { maximum: 100 }
  validates :twitter, length: { maximum: 100 }
  validates :github, length: { maximum: 100 }
  validates :website, length: { maximum: 100 }
end
