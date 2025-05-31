class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
