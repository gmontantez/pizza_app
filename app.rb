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
   	redirect '/summary'
end

get '/summary' do
  	erb :summary, locals: {size: session[:size], size_choice: ('%.2f' % session[:size_choice].to_f), crust: session[:crust], sauce: session[:sauce], meat: session[:meat], veggie: session[:veggie], other: session[:other]}
end

post '/another_pizza' do
	# if session[:cheese_choice] == "cheese"
	# 	session[:pizzas] << [session[:size],session[:size_choice],session[:crust],session[:sauce],session[:cheese_choice]]
	# else
	session[:pizzas] << [session[:size],session[:size_choice],session[:crust],session[:sauce],session[:meat],session[:veggie],session[:other]]
	# end
	p "#{session[:pizzas]}"
	redirect '/pizza_choices'
end

get '/redo' do
    erb :pizza_choices
end

post '/summary' do
	# if session[:cheese_choice] == "cheese"
	# 	session[:pizzas] << [session[:size],session[:size_choice],session[:crust],session[:sauce],session[:cheese_choice]]
	# else
	session[:delivery] = params[:delivery]
	session[:pizzas] << [session[:size],session[:size_choice],session[:crust],session[:sauce],session[:meat],session[:veggie],session[:other]]
	if session[:delivery] == "Yes"
        redirect '/delivery_info'
    elsif session[:delivery] == "No"
        redirect '/payment_page'
    end
	redirect '/payment_page'
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
	if session == "No"
		session[:message] = ""
		erb :payment_page, locals: {size: session[:size], size_choice: ('%.2f' % session[:size_choice].to_f), crust: session[:crust], sauce: session[:sauce], meat: session[:meat], veggie: session[:veggie], other: session[:other], delivery: session[:delivery], address: session[:address], message: session[:message]}
	else session[:message] = "Your address if you selected delivery is:"
		erb :payment_page, locals: {size: session[:size], size_choice: ('%.2f' % session[:size_choice].to_f), crust: session[:crust], sauce: session[:sauce], meat: session[:meat], veggie: session[:veggie], other: session[:other], pay_amount: session[:pay_amount], delivery: session[:delivery], address: session[:address], message: session[:message], delivery_address: session[:delivery_address]}
	end
	session[:pay_amount] = params[:size_choice]
	session[:pay_amount] = 0
	session[:pizzas].each do |pizzas|
		p "here are my pizzas#{pizzas}"
		session[:pay_amount] += pizzas[1]
	end
	session[:pay_amount] += 1.07 * session[:pizzas].length
	p "here is my result #{session[:pay_amount]}"
  	erb :payment_page, locals: {size: session[:size], size_choice: ('%.2f' % session[:size_choice].to_f), crust: session[:crust], sauce: session[:sauce], meat: session[:meat], veggie: session[:veggie], other: session[:other], pay_amount: session[:pay_amount], pizzas: session[:pizzas], delivery: session[:delivery], address: session[:address], delivery_address: session[:delivery_address], message: session[:message]}
end

post '/payment_page' do
	session[:pay_amount] = 0
	session[:pizzas].each do |pizzas|
		p pizzas
		session[:pay_amount] += pizzas[1]
	end
	session[:pay_amount] += 1.07 * session[:pizzas].length
	p session[:pay_amount]
	redirect '/final_page'
end

get '/final_page' do
	erb :final_page
end

	