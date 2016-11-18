class User < ApplicationRecord
	has_one :customer

	validates :username, :password, presence: true
end
