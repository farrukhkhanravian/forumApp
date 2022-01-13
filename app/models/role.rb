class Role < ApplicationRecord
  scopify

  belongs_to :resource, :polymorphic => true, :optional => true
  has_and_belongs_to_many :users
  validates :resource_type, :inclusion => { :in => Rolify.resource_types }, :allow_nil => true
end
