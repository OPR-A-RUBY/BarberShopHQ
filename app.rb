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

# метод before исполняется перед каждым запросом GET или POST ======================
before do
    @barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
    erb :visit
end
