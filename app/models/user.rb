class User < ApplicationRecord
    has_secure_password
    before_save :downcase_email
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :name, presence: true
    # validates :password, presence: true

    private
       def downcase_email
         self.email.downcase!
       end

end
