class Visitor < ApplicationRecord
  validates :name, :company, :purpose, presence: true
end
