class Order < ActiveRecord::Base

  attr_accessor :first_name, :last_name, :ip_address, :card_expires_on 

  before_create :purchase


  def purchase
  response = process_purchase

  puts "---------------------------------------------#{response.success?}  #{response.message}  #{response.inspect}"

  self.errors.add(response.message) unless response.success?
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
    p credit_card, "---------------------------"
    STANDARD_GATEWAY.purchase(133.0, credit_card, standard_purchase_options)
  else
    EXPRESS_GATEWAY.purchase(30000, express_purchase_options)
  end
end

def standard_purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => self.first_name + self.last_name,
        :address1 => self.address1,
        :city     => self.city,
        :state    => self.state,
        :country  => self.country,
        :zip      => self.zip
      }
    }
end

  def credit_card
     @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
       :type               => self.type,
       :number             => self.number,
       :verification_value => self.verification_value,
       :month              => self.month,
       :year               => self.year,
       :first_name         => self.first_name,
       :last_name          => self.last_name
     )
   end




  def express_purchase_options
  {
    :ip => ip_address,
    :token => express_token,
    :payer_id => express_payer_id
  }
end







end
