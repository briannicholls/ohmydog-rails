class Walk < ApplicationRecord
  belongs_to :pet
  belongs_to :walker, class_name: :user
end
