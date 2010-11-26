module WeatherbugDotCom
  class Weather < TransformableData
    register_transformer "//*[name()='aws:station-id']", :name => :station_id
    register_transformer "//*[name()='aws:station']", :name => :station_name
    register_transformer "//*[name()='aws:temp-high']", :name => :temp_high, :transform => :to_i
    register_transformer "//*[name()='aws:temp-low']", :name => :temp_low, :transform => :to_i
    register_transformer "//*[name()='aws:dew-point']", :transform => :to_i, :name => :dew_point
    register_transformer "//*[name()='aws:elevation']", :transform => :to_i, :name => :elevation
    register_transformer "//*[name()='aws:feels-like']", :transform => :to_i, :name => :feels_like
    register_transformer "//*[name()='aws:humidity']", :transform => :to_i, :name => :huminidty
    register_transformer "//*[name()='aws:wind-direction']", :name => :wind_direction
    register_transformer "//*[name()='aws:wind-speed']", :transform => :to_i, :name => :wind_spreed
    register_transformer "//*[name()='aws:pressure']", :transform => :to_f, :name => :pressure
    register_transformer "//*[name()='aws:temp']", :transform => :to_f, :name => :temperature
  end
end
