class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => { email: false, username: true }
 	has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
 	
 def refresh_default_address
  #定义变量 并且保证存在
      _default_id = self.default_address_id

      if not ( _default_id  and self.addresses.exists?(id: _default_id))
          _default_id = self.addresses.first.id
          self.default_address_id = self.addresses.first.id
          self.save

      end
  end




	

end
