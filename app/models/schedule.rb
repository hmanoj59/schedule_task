# require 'ice_cube_methods'

# class Schedule < ApplicationRecord::Base
class Schedule < ActiveRecord::Base


  include IceCubeMethods

  validates :name, :presence => true
  # attr_accessible :remarks, :name
end
