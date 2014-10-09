class Todo < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :project
  belongs_to :user
  validates :project_id, presence: true

end
