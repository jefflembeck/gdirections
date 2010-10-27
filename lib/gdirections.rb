require 'rubygems'
require 'httparty'
require 'hashie'

module Gdirections
  include HTTParty
  format :json
  base_uri "http://maps.googleapis.com"
  
  def self.get_directions(options = {})
    options = {
      :origin => nil,
      :destination => nil,
      :mode => :driving,
      :sensor => :false,
      :waypoints => nil,
      :optimize => 'true'
    }.merge(options)
    
    raise ArgumentError, "Origin required" if options[:origin].nil?
    raise ArgumentError, "Destination required" if options[:destination].nil?
    
    if options[:waypoints] && options[:waypoints].is_a?(Array)
      options[:waypoints] = "optimize:#{(options.delete(:optimize) == true).to_s}|" + options[:waypoints].join('|')
    end
    
    result = get("/maps/api/directions/json", :query => options)
    if result
      Route.new(result.parsed_response)
    end
  end
  
  class Route < Hashie::Mash
    
    def route
      self.routes.first
    end
    
    def legs
      self.route.legs
    end
    
    def distance_in_miles
      (self.route.legs.map{|l| l.duration.value}.inject{|v,l| v+l} / 1610.22).round
    end
    
    def time_in_minutes
      (self.route.legs.map{|l| l.duration.value}.inject{|v,l| v+l} / 60).ceil
    end
  end
  
  
end # Gdirections