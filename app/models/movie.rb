class Movie < ApplicationRecord
  validates :language, :length => {is:2}
end
