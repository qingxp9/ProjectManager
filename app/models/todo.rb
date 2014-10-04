class Todo < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :project
end
