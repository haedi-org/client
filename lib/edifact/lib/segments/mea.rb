class MEA < Line
    def initialize(data, line_no, version, chars)
        super(data, line_no, version, chars)
        # (6311) Measurement purpose qualifier
        @purpose = define([1, 0], "6311", "Measurement purpose qualifier", true)
        # (6313) Property measured, coded
        @attribute_measured = define([2, 0], "6313", "Property measured", true)
        # (6321) Measurement significance, coded
        @significance = define([2, 1], "6321", "Measurement significance", true)
        # (6155) Measurement attribute identification
        @attribute_id = define([2, 2], "6155", 
            "Measurement attribute identification")
        # (6154) Measurement attribute
        @attribute = define([2, 3], "6154", "Measurement attribute")
        # (6411) Measure unit qualifier
        @unit = define([3, 0], "6411", "Measure unit qualifier")
        # (6314) Measurement value
        @value = define([3, 1], "6314", "Measurement value")
        # (6162) Range minimum
        @range_minimum = define([3, 2], "6162", "Range minimum")
        # (6152) Range maximum
        @range_maximum = define([3, 3], "6152", "Range maximum")
        # (6432) Significant digits
        @significant_digits = define([3, 4], "6432", "Significant digits")
        # Push to elements
        push_elements([
            @purpose, @attribute_measured, @significance, @attribute_id,
            @attribute, @unit, @value, @range_minimum, @range_maximum,
            @significant_digits
        ])
    end

    def html
        coded = [[1, 0], [2, 0], [2, 1], [2, 2]]
        typed = [[2, 3], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4]]
        super(coded, typed)
    end

    def debug
        super
        @purpose.tap { |v| puts "Purpose = " + v.ref if v != nil }
        @attribute_measured.tap { |v| puts "Measured = " + v.ref if v != nil }
        @significance.tap { |v| puts "Significance = " + v.ref if v != nil }
        @attribute_id.tap { |v| puts "Attribute ID = " + v.ref if v != nil }
        @attribute.tap { |v| puts "Attribute = " + v if v != nil }
        @unit_code.tap { |v| puts "Unit code = " + v if v != nil }
        @value.tap { |v| puts "Value = " + v if v != nil }
        @range_minimum.tap { |v| puts "Range min = " + v if v != nil }
        @range_maximum.tap { |v| puts "Range max = " + v if v != nil }
        @significant_digits.tap { |v| puts "Sig. digits = " + v if v != nil }
        puts "\n"
    end
end