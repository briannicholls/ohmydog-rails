class User < ApplicationRecord
  has_secure_password

  has_many :walks
  has_many :pets, through: :walks

  #include ActiveModel::Validations
  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: true

  def name
    "#{fname} #{lname}"
  end

  def admin?
    self.role == 'admin'
  end

  def employee?
    self.role == 'employee'
  end

  def customer?
    self.role == 'customer'
  end

  def active?
    self.status == 'active'
  end

  def inactive?
    self.status == 'inactive'
  end
end
