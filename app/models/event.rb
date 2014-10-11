class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :todo
  belongs_to :comment
  validates :user_id, presence: true
  validates :action,  presence: true
  default_scope -> { order('created_at DESC') }
end
