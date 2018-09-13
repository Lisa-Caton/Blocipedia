class User < ApplicationRecord
  has_many :wikis, dependent: :destroy
  has_many :collaborators
  has_many :wikis, through: :collaborators


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { self.email = email.downcase }
  before_save { self.role ||= :standard }


  enum role: [:standard, :admin, :premium]

  after_initialize :set_defaults

  private

  def set_defaults
    if self.new_record?
      self.role ||= :standard
    end
  end

end
