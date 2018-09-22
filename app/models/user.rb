class User < ApplicationRecord
  validates :name, presence: true,
    length: { minimum: 1, maximum: 15, allow_blank: true}

  validates :email, presence: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, allow_blank: true }

  validates :password, presence: true,
    format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]{8,32}\z/i, allow_blank: true }#,
#    length: { minimum: 8, maximum: 32, allow_blank: true }

  validates :password_confirmation, presence: true,
    format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i, allow_blank: true }#,
#    (?=.*?[a-z])(?=.*?\d)の"()"内の中央の"?"は、省略可能のはず。
#    length: { minimum: 8, maximum: 32, allow_blank: true }

  has_secure_password
  
end
