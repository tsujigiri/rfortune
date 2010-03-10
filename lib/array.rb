class Array

  # Returns a RFortune object if the Array contains at least one
  # element convertible to String. Otherwise it returns nil.
  def to_rfortune
    
    cookie_jar = RFortune.new

    self.each { |element|

      begin
        cookie_jar += element.to_s
      rescue
	# Nothing to see here. Keep moving, please.
      end

    }

    cookie_jar.count > 0 ? cookie_jar : nil

  end

end

