require 'pry'

def consolidate_cart(cart)
  consolidated_cart_hash = {}
  cart.each do |item_info|
    item_info.each do |name, data|
      consolidated_cart_hash[name] = data
      if consolidated_cart_hash[name][:count]
        consolidated_cart_hash[name][:count] +=1  
      else
        consolidated_cart_hash[name][:count] =1 
      #binding.pry
      end
    end
  end
  consolidated_cart_hash
end



def apply_coupons(cart, coupons)
cart.each do |item, item_data|
    coupons.each do |coupon|
    #binding.pry
    if cart.keys.include?(coupon[:item]) && coupon[:num] <= cart[item][:count]
      #binding.pry
      cart[item][:count] = (cart[item][:count] - coupon[:num])
        if cart["#{food} W/COUPON"]
          binding.pry
          cart["#{food} W/COUPON"][:count] += 1
        else
          cart["#{food} W/COUPON"] = {:price => coupon[:cost], :clearance => item_data[:clearance], :count => 1}
        end
      end
    end
  end
  cart
end

def apply_coupons(cart, coupons)
  cart.each do |item, item_data|
    coupons.each do |coupon|
    #binding.pry
    if cart.keys.include?(coupon[:item]) && coupon[:num] <= cart[item][:count]
      #binding.pry
      cart[item][:count] = (cart[item][:count] - coupon[:num])
      #binding.pry 
      cart["#{item} W/COUPON"] = { :price => coupon[:cost], :clearance => item_data[:clearance], :count => 1}
      binding.pry
    end
  end
end
end

def apply_clearance(cart)
  #binding.pry
  cart.each do |item, item_data|
    #binding.pry
    if item_data[:clearance] == true 
       item_data[:price] = ((item_data[:price])*0.8).round(1)
        #binding.pry
    end
  end
end


def checkout(cart, coupons)
  # code here
end
