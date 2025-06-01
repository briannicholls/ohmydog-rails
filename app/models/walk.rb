class Walk < ApplicationRecord
  belongs_to :pet
  has_one :walker, class_name: 'User', foreign_key: 'user_id'

  scope :today, -> { where(date: DateTime.current.midnight) }
  scope :completed, -> { where(completed?: true) }

  default_scope do
    user = Thread.current[:current_user]
    if user && user.customer?
      joins(pet: :owner).where(owners: { id: user.owner&.id })
    else
      all
    end
  end

  def pickup_window
    "#{window_start.strftime('%-l:%M%P')} - #{window_end.strftime('%-l:%M%P')}"
  end

end
