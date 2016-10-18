class Address < ApplicationRecord
  belongs_to :user
  validates :consignee_address, presence: true,uniqueness: true
  validates :consignee_name, presence: true

  #def is_default
  	
  #	id == current_user.defalut_adresss_id ##????
  	
  #end

  def default?
  	id == User.find(self.user_id).default_address_id
    # id == current_user.defalut_adresss_id ==>api接口时候也许可以
  end

 


end
