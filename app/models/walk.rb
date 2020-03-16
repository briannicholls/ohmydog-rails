class Walk < ApplicationRecord
  belongs_to :pet
  has_one :walker, class_name: :user

  def pickup_window
    "#{window_start} - #{window_end}"
  end
end
