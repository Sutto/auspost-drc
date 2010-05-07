module AusPost
  module DRC
    class ServiceType
      
      def self.mapping
        @mapping ||= []
      end
      
      def self.add_mapping(short_name, code, description)
        mapping << ServiceType.new(short_name, code, description)
      end
      
      def self.[](code)
        item = mapping.detect { |st| st.matches?(code) }
        item && item.code
      end
      
      def self.for_select
        mapping.map { |st| [st.description, st.short_name.to_s] }
      end
      
      attr_accessor :code, :short_name, :description
      
      def initialize(short_name, code, description)
        @short_name  = short_name.to_s
        @code        = code.to_s
        @description = description.to_s
      end
      
      def to_s
        @code
      end
      
      def matches?(text)
        text = text.to_s.strip
        !text.empty? && [short_name, code, description].any? { |v| v == text }
      end
      
      add_mapping :standard,                                  'Standard', 'Regular'
      add_mapping :express,                                   'Express',  'Express'
      add_mapping :express_platinum,                          'Exp_Plt',  'Express Platinum'
      add_mapping :express_courier_international_document,    'ECI_D',    'Express Courier International Document'
      add_mapping :express_courier_international_merchandise, 'ECI_M',    'Express Courier International Merchandise'
      add_mapping :international_air,                         'Air',      'International Air'
      add_mapping :international_sea,                         'Sea',      'International Sea'
      
    end
  end
end