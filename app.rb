require "sinatra"
require_relative "pizza_ex.rb" 

enable :sessions 

get '/' do
	session[:pizzas] = []
	erb :welcome_page
end

post '/welcome_page' do
    redirect '/pizza_choices' 
end

get '/pizza_choices' do
	session[:size] = ""
	session[:crust] = ""
	session[:sauce] = ""
	session[:size_choice] = ""
	# session[:cheese_choice] = ""
	session[:meat] = ""
	session[:veggie] = ""
	session[:other] = ""
	session[:other_options] = ""
	session[:other_options_choice] = ""
	erb :pizza_choices
end

post '/pizza_choices' do
	session[:size] = params[:size]
	session[:crust] = params[:crust]
	session[:sauce] = params[:sauce]
	session[:size_choice] = cost(session[:size].to_s)
	p session[:size_choice]
	# session[:cheese_choice] = params[:cheese]
	# if session[:cheese_choice] == "cheese"
	# 	session[:meat] = ""
	# 	session[:veggie] = ""
	# 	session[:other] = ""
	# 	redirect '/summary'
	# else
	redirect '/pizza_toppings'
	# end
end

get '/pizza_toppings' do
	 # p "you've selected #{cost(session[:size].to_s)}"
  	erb :pizza_toppings, locals: {size: session[:size], size_choice: ('%.2f' % session[:size_choice].to_f), crust: session[:crust], sauce: session[:sauce]}
end

post '/pizza_toppings' do
	session[:meat] = params[:meat]
	session[:veggie] = params[:veggie]
	session[:other] = params[:other]
	session[:other_options] = params[:other_options]
	p session[:other_options]
	session[:other_options_choice] = 0
	session[:other_options].each do |option|
		session[:other_options_choice] += special_options(option)
	end
	p session[:other_options_choice]
   	redirect '/summary'
end

get '/summary' do
  	erb :summary, locals: {size: session[:size], size_choice: ('%.2f' % session[:size_choice].to_f), crust: session[:crust], sauce: session[:sauce], meat: session[:meat], veggie: session[:veggie], other: session[:other], other_options_choice: ('%.2f' % session[:other_options_choice].to_f)}
end

get '/redo' do
    erb :pizza_choices
end

post '/summary' do
	selected_meats = params[:meat] || []
	selected_veggies = params[:veggie] || []
	selected_other = params[:other] || []
	selected_other_options = params[:other_options] || []
	session[:delivery] = params[:delivery]
	another_pizza = params[:add_another_pizza]
	if selected_meats != []
		#.values turns meat = {"peperoni" => "pepperoni", "ham" => "ham"} to ["peperoni", "ham"]
		#meat.values
		session[:meat] = selected_meats.values
	end
	if selected_veggies != []
		session[:veggie] = selected_veggies.values
	end
	if selected_other != []
		session[:other] = selected_other.values
	end
	if selected_other_options != []
		session[:other_options] = selected_other_options.values
	end
	p session[:meat]
	p session[:veggie]
	p session[:other]
	p session[:other_options_choice]
	if another_pizza == "More"
		session[:pizzas] << [session[:size],session[:size_choice].to_f,session[:crust],session[:sauce],session[:meat],session[:veggie],session[:other], session[:other_options], session[:other_options_choice]]
		p session[:pizzas]
		redirect '/pizza_choices'
	else
		session[:pizzas] << [session[:size],session[:size_choice].to_f,session[:crust],session[:sauce],session[:meat],session[:veggie],session[:other], session[:other_options], session[:other_options_choice]]
		if session[:delivery] == "Yes"
			p session[:pizzas]
	        redirect '/delivery_info'
	    elsif session[:delivery] == "No"
			p session[:pizzas]
	        redirect '/payment_page'
	    end
	end
end

get '/delivery_info' do
	erb :delivery_info
end

post '/delivery_address' do
	session[:address] = params[:address]
	session[:message] = params[:message]
	redirect '/payment_page'
end

get '/payment_page' do
	if session[:delivery] == "No"
		session[:message] = ""
		session[:address] = ""
	else 
		session[:message] = "Your address if you selected delivery is:"
	end
	session[:pay_amount] = 0
	session[:pizzas].each do |pizzas|
		p "here are my pizzas#{pizzas}"
		session[:pay_amount] += pizzas[1]
		session[:pay_amount] += pizzas[8]
	end
	session[:pay_amount] += 1.07 * session[:pizzas].length
	p "here is my result #{session[:pay_amount]}"
  	erb :payment_page, locals: {pay_amount: session[:pay_amount], pizzas: session[:pizzas], delivery: session[:delivery], address: session[:address], delivery_address: session[:delivery_address], message: session[:message]}
end

post '/payment_page' do
	redirect '/final_page'
end

get '/final_page' do
	erb :final_page
end

get '/about_us' do 
	erb :about_us
end

get '/contact_us' do 
	erb :contact_us
end

	