class User < ActiveRecord::Base
  belongs_to :team
  has_many :comments
  has_many :todos
  has_many :events
  validates :team_id, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    admin
  end

end
