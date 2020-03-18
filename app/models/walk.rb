class Walk < ApplicationRecord
  belongs_to :pet
  has_one :walker, class_name: :user

  scope :today, -> { where(window_start: DateTime.current.midnight) }
  scope :completed, -> { where(completed?: true) }

  def pickup_window
    "#{window_start.strftime('%l:%M%P')} - #{window_end.strftime('%l:%M%P')}"
  end

end
