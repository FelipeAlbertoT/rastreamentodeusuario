class User < ApplicationRecord
  has_many :pages, dependent: :destroy
  
  accepts_nested_attributes_for :pages, allow_destroy: true, reject_if: lambda {|attributes| attributes['name'].blank?}
end
