class QTY < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (6063) Quantity qualifier
        @type = define([1, 0], "6063", "Quantity qualifier", true)
        # (6060) Quantity
        @quantity = define([1, 1], "6060", "Quantity")
        # (6411) Measure unit qualifier
        @measurement_unit = define([1, 2], "6411", "Measure unit qualifier")
        # Push to elements
        push_elements([
            @type, @quantity, @measurement_unit
        ])
    end

    def html
        codes = [[1, 0]]
        typed = [[1, 1], [1, 2]]
        super(codes, typed)
    end

    def debug
        super
        @type.tap { |v| puts "Type = " + v.ref if v != nil }
        @quantity.tap { |v| puts "Quantity = " + v if v != nil }
        @measurement_unit.tap { |v| puts "Measurement unit = " + v if v != nil }
        puts "\n"
    end
end