class DockingStation

	def initialize(bikes: [])
		@bikes = bikes
	end

	def bikes
		@bikes 
	end

	def dock bike
		@bikes << bike
	end

	def release_a_bike
		@bikes.pop
	end

end