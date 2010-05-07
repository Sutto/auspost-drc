require 'uri'
require 'net/http'

module AusPost
  module DRC
    class Calculator
      
      DRC_BASE_URI = "http://drc.edeliver.com.au/rateCalc.asp"
      
      def initialize(parcel)
        @parcel = parcel
        @calculated = false
        @charge = nil
        @days = nil
      end
      
      # Once off thing.
      def calculate
        unless @calculated
          uri = URI.parse("#{DRC_BASE_URI}?#{@parcel.to_params}")
          response = Net::HTTP.get(uri)
          process_response response
          @calculated = true
        end
      end
      
      def has_charge?
        calculate
        !@charge.nil?
      end
      
      def has_days?
        calculate
        !@days.nil?
      end
      
      def charge
        calculate
        @charge
      end
      
      def days
        calculate
        @days
      end
      
      def charge!
        value_with_exception :charge
      end
      
      def days!
        value_with_exception :days
      end
      
      protected
      
      def process_response(r)
        body = body_to_hash(r)
        if body[:err_msg].to_s.upcase == "OK"
          process_success_body body
        else
          process_error_body body[:err_msg]
        end
      end
      
      def process_success_body(body)
        @exception = nil
        @charge    = body[:charge].to_f
        @days      = body[:days].to_i
      end
      
      def process_error_body(body)
        @exception = Error.new(body)
        @charge     = nil
        @days      = nil
      end
      
      def value_with_exception(name)
        calculate
        @exception.nil? ? send(name) : raise(@exception)
      end
      
      def body_to_hash(body)
        hash = {}
        body.each_line do |line|
          key, value = line.strip.split("=", 2)
          hash[key.to_sym] = value
        end
        hash
      end
      
    end
  end
end