require 'rubygems'
require 'weatherbug_dot_com'

WeatherbugDotCom.set_code('A5559139565')
p WeatherbugDotCom.current_weather({:lat => -23.53, :long => -46.61})
