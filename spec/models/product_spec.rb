require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Associations" do
    it { should belong_to(:resource) }
    it {should have_many(:comments)}
  end

  describe "Validations" do
    it { should validate_presence_of(:title) }
  end
end
