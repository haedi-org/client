class MEA < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (6311) Measurement purpose qualifier
        @purpose            = val(1, 0, "6311")
        # (6313) Property measured, coded
        @attribute_measured = val(2, 0, "6313")
        # (6321) Measurement significance, coded
        @significance       = val(2, 1, "6321")
        # (6155) Measurement attribute identification
        @attribute_id       = val(2, 2, "6155")
        # (6154) Measurement attribute
        @attribute          = val(2, 3)
        # (6411) Measure unit qualifier
        @unit               = val(3, 0)
        # (6314) Measurement value
        @value              = val(3, 1)
        # (6162) Range minimum
        @range_minimum      = val(3, 2)
        # (6152) Range maximum
        @range_maximum      = val(3, 3)
        # (6432) Significant digits
        @significant_digits = val(3, 4)
    end

    def table
        rows = [header_row]
        # (6311) Measurement purpose qualifier
        unless @purpose == nil
            rows << coded_row("6311", "Measurement purpose qualifier", @purpose)
        end
        # (6313) Property measured, coded
        unless @attribute_measured == nil
            rows << coded_row("6313", "Property measured", @attribute_measured)
        end
        # (6321) Measurement significance, coded
        unless @significance == nil
            rows << coded_row("6321", "Measurement significance", @significance)
        end
        # (6155) Measurement attribute identification
        unless @attribute_id == nil
            rows << coded_row("6155", "Measurement attribute identification", 
                @attribute_id)
        end
        # (6154) Measurement attribute
        unless @attribute == nil
            rows << ["6154", "Measurement attribute", @attribute]
        end
        # (6411) Measure unit qualifier
        unless @unit == nil
            rows << ["6411", "Measure unit qualifier", @unit]
        end
        # (6314) Measurement value
        unless @value == nil
            rows << ["6314", "Measurement value", @value]
        end
        # (6162) Range minimum
        unless @range_minimum == nil
            rows << ["6162", "Range minimum", @range_minimum]
        end
        # (6152) Range maximum
        unless @range_maximum == nil
            rows << ["6152", "Range maximum", @range_maximum]
        end
        # (6432) Significant digits
        unless @significant_digits == nil
            rows << ["6432", "Significant digits", @significant_digits]
        end
        return rows
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