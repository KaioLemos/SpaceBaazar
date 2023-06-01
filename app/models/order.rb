class Order < ApplicationRecord
  belongs_to :user
  belongs_to :part
  validates :part_id, uniqueness: true
end
