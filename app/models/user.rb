class User < ApplicationRecord
  has_many :wikis
  has_many :collaborators
  has_many :collaborators, through: :collaborators, source: :wiki


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

 # Allow username or UserName
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

  # Only allow letter, number, underscore and punctuation -- NOT @ -- to avoid emails as usernames
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

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
