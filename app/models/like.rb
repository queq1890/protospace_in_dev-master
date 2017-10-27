class Like < ActiveRecord::Base
  belongs_to :proyotype, counter_cache: :likes_count
  belongs_to :user
end
