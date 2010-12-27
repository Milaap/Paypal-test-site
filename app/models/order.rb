class Order < ActiveRecord::Base

  attr_accessor :first_name, :last_name, :ip_address

  before_create :purchase


  def purchase
  response = process_purchase

  puts "---------------------------------------------#{response.success?}    #{response.inspect}"

  response.success?
end





  def express_token=(token)
    write_attribute(:express_token, token)
    details = EXPRESS_GATEWAY.details_for(token)
    self.express_payer_id = details.payer_id
    self.first_name = details.params["first_name"]
    self.last_name = details.params["last_name"]

    puts "*******************************8#{details.params["first_name"]}"
  end



  private

def process_purchase
  if express_token.blank?
    STANDARD_GATEWAY.purchase(133.0, credit_card, standard_purchase_options)
  else
    EXPRESS_GATEWAY.purchase(30000, express_purchase_options)
  end
end


  def express_purchase_options
  {
    :ip => ip_address,
    :token => express_token,
    :payer_id => express_payer_id
  }
end







end
