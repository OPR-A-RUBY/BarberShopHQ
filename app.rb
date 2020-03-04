#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, 'sqlite3:barbershop.db'

class Client < ActiveRecord::Base 
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
    erb :visit
end

post '/visit' do	# ===================== V I S I T ======================= POST ===
                                        # Данные из формы представления visit.erb
                                        # теперь становятся переменными этого метода
    @user_name = params[:user_name]
    @phone     = params[:phone]
    @date_time = params[:date_time]
    @barber    = params[:barber]
    @color     = params[:color]
                                        # Хеш для сообщений о необходимости дозаполнить
                                        # форму в visit.erb для записи клиента к барберу.
<<<<<<< HEAD
    hh = {  :user_name => 'Введите имя ',				# VALIDATION
=======
    hh = {  :user_name => 'Введите имя ',
>>>>>>> 07a051360a9d87dcdb9c0789c29e39af64267a14
                :phone => 'Введите номер телефона ',
            :date_time => 'Введите дату и время ' }

    # Для каждой пары ключ-значение делать:
    hh.each do |key, value|
        # если параметр из формы не заполнен (пустой)
        if params[key] == ''
            # то переменной error присвоить союе value из хеша hh
            # т.е переменной error присвоить сообщение об ошибке по даному параметру
            @error = hh[key]
            return erb :visit   # вернуться в форму для ввода недостающего параметра 
        end
    end

    @title = 'Спасибо!'
    @message = "Спасибо вам, #{@user_name}, будем ждать Вас."
  
    # db = get_db                         # Внести данные базу, таблица db_t_visit
    # db.execute 'INSERT INTO db_t_visit 
    #     (
    #         user_name, 
    #         phone, 
    #         data_time, 
    #         barber,
    #         color
    #     ) 
    #     VALUES ( ?, ?, ?, ?, ?)', 
    #     [
    #         @user_name,                 # порядок здесь должен соответствовать
    #         @phone,                     # порядку в запросе INSERT (выше)
    #         @date_time, 
    #         @barber,
    #         @color
    #     ]    

    erb :message

end