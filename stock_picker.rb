def stock_picker(stock_prices)
  lowest_price = stock_prices[0]
  profit = 0
  lowest_day = 0
  buy_day = 0
  sell_day = 0
  stock_prices.each_with_index do |price, day|
    if price < lowest_price
      lowest_price = price
      lowest_day = day
    end
    if (price - lowest_price) > profit
      profit = price - lowest_price
      buy_day = lowest_day
      sell_day = day
    end
  end
  [buy_day, sell_day]
end

print stock_picker([17,3,6,9,15,8,6,1,10])