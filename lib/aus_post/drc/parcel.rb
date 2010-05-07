require 'cgi'

module AusPost
  module DRC
    class Parcel
    
      attr_accessor :destination, :pickup, :country, :service_type, :weight,
                    :length, :width, :height, :quantity
      
      def initialize(options = {})
        options.each_pair do |key, value|
          real_key = :"#{key}="
          send(real_key, value) if respond_to?(real_key)
        end
      end
      
      def country
        @country ||= 'AU'
      end
      
      def quantity
        @quantity.nil? ? 1 : @quantity.to_i
      end
      
      def destination
        @destination.nil? ? nil : @destination.to_s
      end
      
      def pickup
        @pickup.nil? ? nil : @pickup.to_s
      end
      
      def service_type
        @service_type.nil? ? 'STANDARD' : @service_type
      end
      
      def to_params_hash
        {
          'Pickup_Postcode'      => self.pickup,
          'Destination_Postcode' => self.destination,
          'Country'              => self.country,
          'Service_Type'         => self.service_type,
          'Weight'               => self.weight,
          'Length'               => self.length,
          'Width'                => self.width,
          'Height'               => self.height,
          'Quantity'             => self.quantity
        }
      end
      
      def to_params
        params = []
        to_params_hash.each_pair do |key, value|
          params << "#{key}=#{value}"
        end
        params.join("&")
      end
    
    end
  end
end