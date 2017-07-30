class Page < ApplicationRecord
  belongs_to :user
  
   validates :name, uniqueness: {scope: [:url, :user_id]}
end
