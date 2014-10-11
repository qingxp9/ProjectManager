class Comment < ActiveRecord::Base
  belongs_to :todo
  belongs_to :user
  validates :todo_id, presence: true
  validates :user_id, presence: true
  has_many :events
end
