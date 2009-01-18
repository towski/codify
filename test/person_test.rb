require File.join(File.dirname(__FILE__), 'test_helper')

class PersonTest < Test::Unit::TestCase
	it "stores my update function" do
		state_function = lambda do |datetime|
			day_of_week = DateTime::DAYNAMES[datetime.wday]
			hour = datetime.hour
			@nighttime_activity ||= rand(2)
			@return_home_hour ||= rand(3)
			if ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"].include?(day_of_week)
				@location = :home
				case hour
					when (0..8)
						@nighttime_activity = nil
						@return_home_hour = nil
						@activity = "sleeping"
					when 9
						@activity = "showering"
					when 10
						@location = "between :home and :office"
						@activity = :travelling
					when (11..12)
						@location = :work
						@activity = "working or browsing internet"
					when 13
						@location = [:work, "the carts", "local restaurant"][rand(3)]
						@activity = :eating
					when (14..19)
						@location = :work
						@activity = "working or browsing internet"
					when 20
						@location = "around :work"
						@activity = :eating
					when (21..23)
						if hour % 21 == @return_home_hour
							@location = "between :home and :office"
							@activity = :travelling
						else
							@location = [":office or :home", "around the pearl or :home"][nighttime_activity]
							@activity = ["playing video games", :drinking][nighttime_activity]
						end
				end
			end
		end
		me = Person.create(:state_function =>  state_function)
		now = DateTime.parse("Fri Jan 16 14:32:06 PST 2009")
		me.go(now)
		me.location.should == :work
		me.activity.should == "working or browsing internet"
	end
end
