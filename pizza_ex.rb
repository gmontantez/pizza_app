# def menu 
#    "\nCatalona's Pizza
#    \n\nPizza Sizes\nSmall $13.00  Medium $16.00  Large $18.00
#    \nCrust Flavors\nPlain  Garlic  Stuffed
#    \nSauces\nTomato  Alfredo
#    \nToppings\nPepperoni  Sausage  Ham  Mushrooms  Black Olive  Green Pepper  Chicken  Spinach  Anchovies
#    \nExtra Toppings\nExtra Cheese $1.00  Double Pepperoni $2.00  Feta Cheese $3.00
#    \nWings\nBBQ  Honey Mustard  Garlic  Hot\n8 Piece $6.00  16 Piece $11.00  24 Piece $16.00
#    \nSalads\nHouse Salad  Ceaser Salad  Greek Salad  $5.00 each\nSalad Dressing\nRanch  Blue Cheese  House  Ceaser  Greek
#    \nBottled Drinks\nCoke  Diet Coke  Sprite  Iced Tea  Water"
# end
# def crust
#    crust = ["plain","garlic","stuffed"].sample
# end
# def meats
#    meats = ["pepperoni","sausage","ham","ground beef"].sample
# end
# def veggies
#    veggies = ["mushrooms","black olives","green peppers"].sample
# end
# def toppings
#    toppings = ["anchovies","chicken","spinach"].sample
# end
# def sauces
#    sauces = ["tomato","alfredo"].sample
# end
# def other_options
#    other_options = ["extra cheese","double pepperoni","feta cheese"].sample #special toppings costing extra
# end
# def wings
#    wings = ["bbq","honey mustard","garlic","hot"].sample
# end
# def salad
#    salad = ["house salad","ceaser salad","greek salad"].sample
# end
# def salad_dressings
#    salad_dressings = ["ranch","blue cheese","house","ceaser","greek"].sample
# end
# def drinks
#    drinks = ["coke","diet coke","sprite","iced tea","water"].sample
# end
# def size
#    size = ["small","medium","large"].sample
# end
# def wings_size
#    wings_size = ["8 piece","16 piece","24 piece"].sample
# end
# def wing_order
#    wing_order = ["yes","no"].sample
# end
# def salad_order
#    salad_order = ["yes","no"].sample
# end
# def drink_order
#    drink_order = ["yes","no"].sample
# end 
# def delivery
#    delivery = ["yes","no"].sample
# end


def cost(size)
	if size == "small"
      13.00
	elsif size == "medium"
      16.00
   elsif size == "large"
      19.00
   end
end

# def special_options(other_options)
#    if other_options == "extra cheese"
#       1.00
#    elsif other_options == "double meat"
#       2.00
#    elsif other_options == "feta cheese"
#       3.00
#    end
# end

# def amount(wings_size)
#    if wings_size == "8 piece"
#       6.00
#    elsif wings_size == "16 piece"
#       11.00
#    elsif wings_size == "24 piece"
#       16.00
#    end
# end
# def wings_choice(wing_order)
#    if wing_order == "yes"
#       puts wings_size
#    end
# end

# def delivery_choice(delivery)
#    if delivery == "yes"
#       3
#    else 
#       0
#    end
# end

# puts menu


# puts "\n\nHow many pizzas would you like?"
# pizzas = gets.chomp.to_i

# puts "\nNow please tell me what size, the type of crust, and the toppings."
# puts "\nAny of the special toppings will be extra."
# puts "The special toppings are extra cheese, double pepperoni, and feta cheese."


# pizza = 1
# subtotal = 0
# while pizza <= pizzas do
#    pizza_size = size
#    pizza_cost = cost(pizza_size)
#    other = other_options
#    other_cost = special_options(other)
#  #   puts "\nPizza #{pizza}"
#  #   puts "So, you would like a #{pizza_size} pizza at $#{sprintf("%0.02f", pizza_cost)}."
# 	# puts "You would like a #{crust} crust, with #{sauces} sauce, your toppings will be #{veggies}, #{meats} and #{toppings}."  
#  #   puts "You would also like #{other} at $#{sprintf("%.02f", other_cost)}.\n"
   # pizza +=1
# end
# puts "\nWould you like to add wings, salad, or drinks to your order?"
# additional_items_choice = gets.chomp
# if additional_items_choice == "yes" || additional_items_choice == "Yes"
#    puts "\nWould you like wings?"
#    wings_option = gets.chomp
#    puts "\nWould you like a salad?"
#    salad_option = gets.chomp
#    puts "\nWould you like a drink?"
#    drink_option = gets.chomp
#    if wings_option == "yes"
#       wings_amount = wings_size
#       wings_cost = amount(wings_amount)
#       puts "\nSo, you would like #{wings_amount} for $#{sprintf("%.02f", wings_cost)}."
#    end
#    if salad_option == "yes"
#       salad_type = salad
#       salad_cost = 5.00
#       puts "\nWould you like dressing with your salad?"
#       dressing_choice = gets.chomp
#       if dressing_choice == "yes"
#          dressing_type = salad_dressings
#          puts "\nSo you would like #{salad_type} with #{dressing_type} dressing."
#       else
#          puts "\nSo you would like #{salad_type}."
#       end
#    end
#    if drink_option == "yes"
#       drink_type = drinks
#       drink_cost = 1.75
#       puts "\nSo you would like #{drink_type} for $#{sprintf("%.02f", drink_cost)}."
#    end
# else
#    drink_cost = 0
#    salad_cost = 0
#    wings_cost = 0
#    puts "So, you would not like any additonal items added to your order."
# end

# tax = 1.07
# subtotal += pizza_cost + other_cost + wings_cost + salad_cost + drink_cost 
# total_cost = subtotal * tax

# delivery_option = delivery
# delivery_cost = delivery_choice(delivery_option)

# if delivery_option == "yes"
#    puts "\nWhat would you like to tip?"
#    tip = gets.chomp.to_f
# else
#    tip = 0
# end


# puts "\nThe total cost including tax is $#{sprintf("%.02f", total_cost)}."
# puts "\nYour choice for delivery is #{delivery_option}."
# puts "\nThe delivery cost is $#{sprintf("%.02f", delivery_cost)}."
# puts "\nThe tip amount is $#{sprintf("%.02f", tip)}."


#  