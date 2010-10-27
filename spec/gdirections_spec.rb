require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'pp'

describe "Gdirections" do
  
  before :all do
    @result = Gdirections.get_directions(
      :origin => "Bevely Hills, CA 90210",
      :destination => "Minneapolis, MN 55141",
      :waypoints => ["Hoboken, NJ", "Las Vegas, NV", "Anchorage, AK"]
    )
  end
  
  it "should get a result from google" do
    @result.should_not_be_nil
  end
  
  it "should handle waypoints" do
    @result.route.waypoint_order.count.should eql(3)
  end
  
end
