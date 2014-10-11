class Todo < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :events
  belongs_to :project
  belongs_to :user
  validates :project_id, presence: true

end
