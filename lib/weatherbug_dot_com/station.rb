module WeatherbugDotCom
  class Station
    def self.from_document(document)
      me = self.new
      document.attributes.each do |a, v|
        a = 'station_id' if a == 'id'
        me.instance_variable_set("@#{a}", v.text)
      end
      me
    end

  end
end
