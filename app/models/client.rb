class Client < ApplicationRecord
  belongs_to :movie, optional: true
  validates :name, :email, presence: true
end
