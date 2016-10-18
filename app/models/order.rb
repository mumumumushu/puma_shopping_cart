class Order< ApplicationRecord
	belongs_to :user 
	has_many :commodities , dependent: :destroy
 	validates :order_name, presence: true,uniqueness: true

 	# before_validation :can?
 	# validates :can?, presence: true

                    

	def sum
      self.sum_price = 0 
      self.commodities.each do |c|
         self.sum_price = c.c_num.to_f * c.c_price.to_f +  self.sum_price
      end    
  end

  protected

  # def can?
  
  # 	false
  	
  # end
end

