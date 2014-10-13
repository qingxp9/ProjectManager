class Todo < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  belongs_to :project
  belongs_to :user
  validates :project_id, presence: true

end
