class Project < ActiveRecord::Base
  belongs_to :team
  has_many :todos, dependent: :destroy
  has_many :accesses, dependent: :destroy
  has_many :users, through: :accesses
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :team_id, presence: true
end
