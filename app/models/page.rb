class Page < ApplicationRecord
  belongs_to :user
  
  validates :name, :url, :user_id, presence: true
  
  validates :name, uniqueness: {scope: [:url, :user_id]}
end
