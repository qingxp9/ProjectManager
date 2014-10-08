class Project < ActiveRecord::Base
  belongs_to :team
  has_many :todos, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :team_id, presence: true
end
