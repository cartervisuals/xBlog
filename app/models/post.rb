class Post < ActiveRecord::Base

  belongs_to :category
  belongs_to :user

  has_many :comments

  has_attached_file :image, :default_url => ":style/rails.jpg"
  validates_attachment_content_type :image, :content_type =>/\Aimage\/.*\Z/

  validates_presence_of :title
  validates_presence_of :category_id
  validates_presence_of :body

  def self.search(query)
    where("title like ? or body like ?", "%#{query}%", "%#{query}%")
  end

end
