class Post < ActiveRecord::Base

  belongs_to :category
  belongs_to :users

  has_many :comments

  validates_presence_of :title
  validates_presence_of :category_id
  validates_presence_of :body

end
