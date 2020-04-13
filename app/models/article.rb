class Article < ApplicationRecord

  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  validates_presence_of :title,
                        :body

  def tag_list
    tags.map do |t|
      t.name
    end.join(', ')
  end

  def tag_list=(tags_string)
    
  end
end