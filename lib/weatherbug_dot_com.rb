require 'rubygems'
require 'nokogiri'
require 'open-uri'

require 'weatherbug_dot_com/transformable_data'

require 'weatherbug_dot_com/station'
require 'weatherbug_dot_com/weather'

module WeatherbugDotCom
  API_URL = 'api.wxbug.net'

  def self.make_request(action, params)
    Nokogiri::XML(open(get_url(action, params)))
  end

  def self.closest_station(*args)
    response = make_request('getStationsXML', *args)
    Station.from_document(response.xpath('/aws:weather/aws:stations/aws:station').first)
  end

  def self.get_url(action, params = {})
    unless @code.nil?
      p = {:Acode => @code, :UnitType => 1}
      p.merge!(params)
      p = p.map {|k,v| "#{k}=#{v}"}.join('&')
      "http://#{@code}.#{API_URL}/#{action}.aspx?#{p}"
    else
      raise WeatherbugCodeError
    end
  end

  def self.current_weather(*args)
    response = make_request('getLiveWeatherRSS', *args)
    Weather.from_document(response.xpath("/rss/channel/*[name()='aws:weather']/*[name()='aws:ob']"))
  end

  def self.set_code(code)
    @code = code
  end

end

