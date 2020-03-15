class Walk < ApplicationRecord
  belongs_to :pet
  has_one :walker, class_name: :user
end
