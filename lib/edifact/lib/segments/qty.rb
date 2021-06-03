class QTY < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (6063) Quantity qualifier
        @type             = val(1, 0, "6063")
        # (6060) Quantity
        @quantity         = val(1, 1)
        # (6411) Measure unit qualifier
        @measurement_unit = val(1, 2)
    end

    def html
        codes = [[1, 0]]
        typed = [[1, 1], [1, 2]]
        super(codes, typed)
    end

    def table
        rows = [header_row]
        # (6063) Quantity qualifier
        unless @type == nil
            rows << coded_row("6063", "Quantity qualifier", @type)
        end
        # (6060) Quantity
        unless @quantity == nil
            rows << ["6060", "Quantity", @quantity]
        end
        # (6411) Measure unit qualifier
        unless @measurement_unit == nil
            rows << ["6411", "Measure unit qualifier", @measurement_unit]
        end
        return rows
    end

    def debug
        super
        @type.tap { |v| puts "Type = " + v.ref if v != nil }
        @quantity.tap { |v| puts "Quantity = " + v if v != nil }
        @measurement_unit.tap { |v| puts "Measurement unit = " + v if v != nil }
        puts "\n"
    end
end