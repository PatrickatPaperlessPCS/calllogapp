class Host < ActiveRecord::Base
   has_many :contacts
   has_many :users
   has_many :admins
end
