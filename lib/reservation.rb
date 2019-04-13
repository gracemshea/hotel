class Reservation
    COST_PER_NIGHT = 200
	class << self
		@id = 0
		def next_id
			@id += 1
		end
    end
	def initialize(start_date, end_date) 
		raise "Invalid Date Range" if end_date <= start_date
        @id = self.class.next_id
        @dates = Range.new(start_date, end_date, true)
    end
	def check_in_date
		@dates.first
    end
	def check_out_date
		@dates.end
    end
	def num_days
		@dates.to_a.count
    end

	def total_cost
		num_days * COST_PER_NIGHT
    end

	def include?(date)
		@dates.include?(date)
	end
