class Product < ApplicationRecord
  belongs_to :resource, polymorphic: true
  has_many :categories, as: :resourcecat, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings
  accepts_nested_attributes_for :taggings
  has_many :likes, dependent: :destroy

  validates :title, presence: :true

  # please write down the scope to count likes and unlikes

  def create_tags tags
    self.taggings.destroy_all if self.taggings.present?
    tags.each { |id| self.taggings.create(tag_id: id) }
  end

  def like user
    self.likes.create(user_id: user.id)
  end

  def unlike user
    user.likes.find_by(product: self).destroy
  end
end
