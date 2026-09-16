class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [ :google_oauth2 ]

  has_one :owner
  has_many :walks_as_walker, class_name: "Walk", foreign_key: "user_id"
  has_many :pets, through: :walks

  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: true

  after_create :link_owner

  def name
    "#{fname} #{lname}"
  end

  def admin?
    role == "admin"
  end

  def employee?
    role == "employee"
  end

  def customer?
    role == "customer"
  end

  def active?
    status == "active"
  end

  def inactive?
    status == "inactive"
  end

  def self.from_omniauth(auth)
    info = auth.info
    first_name = info.first_name.presence || info.name.to_s.split.first
    last_name = info.last_name.presence || info.name.to_s.split[1..].to_a.join(" ").presence || first_name

    user = find_by(provider: auth.provider, uid: auth.uid) || find_by(email: info.email)
    if user
      user.assign_attributes(provider: auth.provider, uid: auth.uid)
      user.fname = first_name if user.fname.blank?
      user.lname = last_name if user.lname.blank?
      user.save
      user
    else
      create(
        email: info.email,
        fname: first_name,
        lname: last_name,
        password: Devise.friendly_token[0, 20],
        provider: auth.provider,
        uid: auth.uid
      )
    end
  end

  private

  def link_owner
    self.owner = Owner.find_by(email: email) if owner.nil?
  end
end
