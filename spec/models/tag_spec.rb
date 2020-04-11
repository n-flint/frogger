require 'rails_helper'

describe Tag, type: :model do
  describe 'realationships' do
    it {should have_many :taggings}
  end
end