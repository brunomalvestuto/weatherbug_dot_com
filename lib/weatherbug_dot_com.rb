require 'rubygems'
require 'nokogiri'
require 'open-uri'
require './weatherbug_dot_com/station.rb'
require './weatherbug_dot_com/weather.rb'

class WeatherbugCodeError < Exception;end

module WeatherbugDotCom
  API_URL = 'api.wxbug.net'
  ACTIONS = {
    :stations_by_coordinates => 'getStationsXML.aspx',
    :live_weather => 'getLiveWeatherRSS.aspx'
  }

  def self.make_request(action, params)
    Nokogiri::XML(open(get_url(action, params)))
  end

  def self.closest_station(*args)
    response = make_request(:stations_by_coordinates, *args)
    Station.from_document(response.xpath('/aws:weather/aws:stations/aws:station').first)
  end

  def self.get_url(action, params = {})
    unless @code.nil?
      p = {:Acode => @code}
      p.merge!(params)
      p = p.map {|k,v| "#{k}=#{v}"}.join('&')
      puts  "http://#{@code}.#{API_URL}/#{ACTIONS[action]}?#{p}"
    else
      raise WeatherbugCodeError
    end
  end


  def self.current_weather(*args)
    response = make_request(:live_weather, *args)
    Weather.from_document(response.xpath('/aws:weather/aws:stations/aws:station').first)
  end

  def self.set_code(code)
    @code = code
  end

end

WeatherbugDotCom.set_code('A5559139565')
p WeatherbugDotCom.current_weather({:lat => -23.53, :long => -46.61})
