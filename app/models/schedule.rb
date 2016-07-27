# require 'ice_cube_methods'

class Schedule < ApplicationRecord
  # include IceCubeMethods

  validates :name, :presence => true
end
