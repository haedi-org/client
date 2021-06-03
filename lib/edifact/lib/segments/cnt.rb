class CNT < Line
    def initialize(data, version, chars)
        super(data, version, chars)
		# (6069) Control qualifier
        @control_qualifier = val(1, 0, "6096")
		# (6066) Control value
        @control_value = val(1, 1)
		# (6411) Measure unit qualifier
        @measure_unit = val(1, 2)
    end

    def html
        coded = [[1, 0]]
        typed = [[1, 1], [1, 2]]
        super(coded, typed)
    end

    def table
        rows = [header_row]
        # (6069) Control qualifier
        unless @control_qualifier == nil
            rows << coded_row("6069", "Control qualifier", @control_qualifier)
        end
		# (6066) Control value
        unless @control_value == nil
            rows << ["6066", "Control value", @control_value]
        end
		# (6411) Measure unit qualifier
        unless @measure_unit == nil
            rows << ["6411", "Measure unit qualifier", @measure_unit]
        end
        return rows
    end

    def debug
        super
        puts "\n"
    end
end