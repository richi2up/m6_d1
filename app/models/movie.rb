class Movie < ApplicationRecord
    has_one :client
    validates :title, :director, presence: true
  end
  