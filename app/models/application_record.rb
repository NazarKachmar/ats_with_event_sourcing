# frozen_string_literal: true

require './app/lib/mysql_json_accessor'

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
