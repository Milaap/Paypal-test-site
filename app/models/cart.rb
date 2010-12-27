class Cart < ActiveRecord::Base



  def paypal_url(return_url, notify_url)
    values = {
        :business => "admila_1293364408_biz@gmail.com",
        :cmd => "_xclick",
        :upload => 1,
        :return => return_url,
        :invoice_id => 234,
        :display => '1',
        :notify_url => notify_url
    }
    values.merge!({
       :amount => 123,
      :item_name => "Amala",
      :item_number => 66,
#      :quantity => 2
                  })

    "https://www.sandbox.paypal.com/cgi-bin/webscr?#{values.map { |k, v| "#{k}=#{v}" }.join("&")}"

    end

 end