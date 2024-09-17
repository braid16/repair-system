class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :authentication_keys => [:phone_number]
  has_many :repairs
  validates :phone_number, presence: true, uniqueness: true
   # 禁用email验证
   def email_required?
    false
  end

  def email_changed?
    false
  end

end
