class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_courses
  has_many :courses, through: :user_courses

  belongs_to :role

  before_validation :set_default_role

  def has_role?(role_sym)
    role.name.to_sym == role_sym.to_sym
  end

  private

  def set_default_role
    self.role ||= Role.find_by(name: :user)
  end
end
