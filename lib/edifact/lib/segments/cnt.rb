class CNT < Line
    def initialize(data, line_no, version, chars)
        super(data, line_no, version, chars)
		# (6069) Control qualifier
        @control_qualifier = define([1, 0], "6069", "Control qualifier", true)
		# (6066) Control value
        @control_value = define([1, 1], "6066", "Control value")
		# (6411) Measure unit qualifier
        @measure_unit = define([1, 2], "6411", "Measure unit qualifier")
        # Push to elements
        push_elements([
            @control_qualifier, @control_value, @measure_unit
        ])
    end

    def html
        coded = [[1, 0]]
        typed = [[1, 1], [1, 2]]
        super(coded, typed)
    end

    def debug
        super
        puts "\n"
    end
end