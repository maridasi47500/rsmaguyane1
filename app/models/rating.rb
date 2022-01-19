class Rating < ApplicationRecord
belongs_to :member
belongs_to :image
validates_uniqueness_of :member_id, scope: :image_id
end
