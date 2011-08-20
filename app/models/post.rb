class Post < ActiveRecord::Base
  validates_presence_of :name,:title
  validates_length_og :title >= 5
end
