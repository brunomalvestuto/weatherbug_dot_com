module WeatherbugDotCom
  class Station < TransformableData
    register_transformer '@id', :name => :station_id
    register_transformer '@name'
    register_transformer '@distance', :transform => :to_f
    register_transformer '@zipcode', :name => :zip_code
    register_transformer '@city-code', :transform => :to_i
    register_transformer '@station-type'
    register_transformer '@city'
    register_transformer '@state'
    register_transformer '@country'
    register_transformer '@latitude', :transform => :to_f
    register_transformer '@longitude', :transform => :to_f
  end
end
