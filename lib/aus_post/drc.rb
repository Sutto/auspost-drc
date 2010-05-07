module AusPost
  module DRC
    
    Error = Class.new(StandardError)
    
    autoload :Parcel,      'aus_post/drc/parcel'
    autoload :Calculator,  'aus_post/drc/calculator'
    autoload :ServiceType, 'aus_post/drc/service_type'
    
    def self.calculate(params = {})
      Calculator.new(Parcel.new(params))
    end
    
  end
end