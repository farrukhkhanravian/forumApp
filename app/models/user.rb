class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :products, as: :resource, dependent: :destroy
  has_and_belongs_to_many :roles
  has_many :comments, dependent: :destroy #as: :commentable, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :assign_default_role

  def admin?
    has_role?(:admin)
  end

  def client?
    has_role?(:client)
  end

  private

  def assign_default_role
    self.add_role :client
  end
end
