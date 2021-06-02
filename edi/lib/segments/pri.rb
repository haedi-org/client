class PRI < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (5125) Price qualifier
        @price_qualifier        = val(1, 0, "5125")
        # (5118) Price
        @price                  = val(1, 1)
        # (5375) Price type, coded
        @type                   = val(1, 2, "5375")
        # (5387) Price type qualifier
        @type_qualifier         = val(1, 3, "5387")
        # (5284) Unit price basis 
        @unit_price_basis       = val(1, 4)
        # (6411) Measure unit qualifier
        @measure_unit           = val(1, 5)
        # (5213) Sub-line price change, coded
        @sub_line_price_changed = val(2, 0, "5213")
    end

    def html
        coded = [[1, 0], [1, 2], [1, 3], [2, 0]]
        typed = [[1, 1], [1, 4], [1, 5]]
        super(coded, typed)
    end

    def table
        rows = [header_row]
        # (5125) Price qualifier
        unless @price_qualifier == nil
            rows << coded_row("5125", "Price qualifier", @price_qualifier)
        end
        # (5118) Price
        unless @price == nil
            rows << ["5118", "Price", @price]
        end
        # (5375) Price type, coded
        unless @type == nil
            rows << coded_row("5375", "Price type", @type)
        end
        # (5387) Price type qualifier
        unless @type_qualifier == nil
            rows << coded_row("5387", "Price type qualifier", @type_qualifier)
        end
        # (5284) Unit price basis 
        unless @unit_price_basis == nil
            rows << ["5284", "Unit price basis", @unit_price_basis]
        end
        # (6411) Measure unit qualifier
        unless @measure_unit == nil
            rows << ["6411", "Measure unit qualifier", @measure_unit]
        end
        # (5213) Sub-line price change, coded
        unless @sub_line_price_changed == nil
            rows << coded_row("5213", "Sub-line price change", 
                @sub_line_price_changed)
        end
        return rows
    end

    def debug
        super
        @price.tap { |v| puts "Price = " + v if v != nil }
        @price_qualifier.tap { |v| puts "Qualifier = " + v.ref if v != nil }
        @type.tap { |v| puts "Price type = " + v.ref if v != nil }
        @type_qualifier.tap { |v| puts "Type qualifier = " + v.ref if v != nil }
        @unit_price_basis.tap { |v| puts "Price basis = " + v if v != nil }
        @measure_unit.tap { |v| puts "Measure unit = " + v if v != nil }
        puts "\n"
    end
end