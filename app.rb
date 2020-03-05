#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, 'sqlite3:barbershop.db'

class Client < ActiveRecord::Base 
	validates :name, presence: true 
	validates :phone, presence: true 
	validates :datestamp, presence: true 
	validates :color, presence: true 
end

class Barber < ActiveRecord::Base
end

# == метод before исполняется перед каждым запросом GET или POST ======================
before do
    @barbers = Barber.all
end

get '/' do 			# ================================================================
	erb :index
end 

get '/visit' do		# ===================== V I S I T ======================== GET ===
    @c = Client.new
    erb :visit
end

post '/visit' do	# ===================== V I S I T ======================= POST ===
     
  	@c = Client.new params[:client]	# Создать нового клиента, у которого будут 
  									# параметы как у объекта client.
  	# Они будут заполняться сразу в форме visit.erb и передаваться сюда хешем.

  	if @c.save						# Записать данные в таблицу БД
  									# Здесь происходит валидация данных
  	# настройка которых происходит при описании class Client (см. выше)
    
	    erb "Спасибо, будем ждать Вас."

	else

		@error = @c.errors.full_messages.first
	    erb :visit
	
	end 
 
end