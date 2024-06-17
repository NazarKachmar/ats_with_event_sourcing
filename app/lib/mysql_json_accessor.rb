# frozen_string_literal: true

require 'active_support/concern'

module MysqlJsonAccessor
  extend ActiveSupport::Concern

  class_methods do # rubocop:disable Metrics/BlockLength
    def mysql_json_accessor(attribute, fields_with_types)
      fields_with_types.each do |field, type|
        define_method(field) do
          self.class.send(:cast_value, self[attribute][field.to_s], type)
        end

        define_method("#{field}=") do |value|
          self[attribute] ||= {}
          self[attribute][field.to_s] = self.class.send(:cast_value, value, type)
        end
      end
    end

    private

    def cast_value(value, type) # rubocop:disable Metrics/MethodLength
      case type
      when :integer
        value.to_i
      when :float
        value.to_f
      when :boolean
        ActiveRecord::Type::Boolean.new.cast(value)
      when :datetime
        begin
          Time.parse(value)
        rescue StandardError
          nil
        end
      else
        value
      end
    end
  end
end

ActiveRecord::Base.include MysqlJsonAccessor
