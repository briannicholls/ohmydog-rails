class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :owner
  has_many :walks_as_walker, class_name: 'Walk', foreign_key: 'user_id'
  has_many :pets, through: :walks

  #include ActiveModel::Validations
  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: true

  after_create :link_owner

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

  private

  def link_owner
    if self.owner.nil?
      self.owner = Owner.find_by(email: self.email)
    end
  end
end
