class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :execute_request, :get_name, :get_url
  BASE_URL = 'https://swapi.co/api'

  def execute_request(uri)
    require 'open-uri'
    require 'json'
    response = open("#{BASE_URL}/#{uri}").read
    JSON.parse(response)
  end

  def get_name(url)
    require 'open-uri'
    require 'json'
    if url.include? BASE_URL
      response = open(url).read
      JSON.parse(response)['name']
    else
      "Error"
    end
  end

  def get_url(url)
    if url.include? BASE_URL
      url.slice! BASE_URL+'/'
      url
    else
      "Error"
    end
  end

  def get_type(url)
    types = ['films', 'people', 'planets', 'starships']
    types = types.select{|word| url.include? word}
    if types.empty?
      "Error"
    else
      types[0]
    end
  end
end
