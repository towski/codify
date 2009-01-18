class Person < Sequel::Model(:people)
	attr_accessor :location, :activity

	def state_function=(block)
		c = Class.new
		c.class_eval do
			define_method :serializable, &block
		end
		s = RubyToRuby.translate(c, :serializable)
		s.sub!(/^def \S+\(([^\)]*)\)/, 'lambda { |\1|')
		s.sub!(/^end$/, '}')
		self[:state_function] = s
	end

	def go(now)
		if state_function
			eval(state_function).call(now)
		else
			generic_state_function
		end
	end
end
