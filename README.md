gdirections

A quick wrapper for Google Maps directions API that support waypoints.

Returns an object version of the directions results, http://code.google.com/apis/maps/documentation/directions/#JSON

Example:
<pre>
result = Gdirections.get_directions(:origin => "Bevely Hills, CA 90210", :destination => "Minneapolis, MN 55141")
route = result.routes.first
puts route.legs.first.steps.map{|s| "#{s.html_instructions}, #{s.distance.text}"}
</pre>

== Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

== Copyright

Copyright (c) 2010 Andrew Stevens. See LICENSE for details.
