class Category < ApplicationRecord
  belongs_to :resourcecat, polymorphic: true
end
