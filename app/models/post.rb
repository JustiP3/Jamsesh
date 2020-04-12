class Post < ApplicationRecord
    belongs_to :band
    accepts_nested_attributes_for :band
end
