class PIA < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (4347) Product id. function qualifier
        @product_identifier = val(1, 0, "4347")
        # (7140) Item number
        @item_number        = val(2, 0)
        # (7143) Item number type, coded
        @item_number_type   = val(2, 1, "7143")
        # (1131) Code list qualifier 
        @code_list          = val(2, 2, "1131")
        # (3055) Code list responsible agency, coded
        @agency             = val(2, 3, "3055")
    end

    def html
        coded = [[1, 0], [2, 1]]
        typed = [[2, 0]]
        mssge = [[2, 2], [2, 3]]
        super(coded, typed, mssge)
    end

    def table
        rows = [header_row]
        # (4347) Product id. function qualifier
        unless @product_identifier == nil
            rows << coded_row("4347", "Product id. function qualifier", 
                @product_identifier)
        end
        # (7140) Item number
        unless @item_number == nil
            rows << ["7140", "Item number", @item_number]
        end
        # (7143) Item number type, coded
        unless @item_number_type == nil
            rows << coded_row("7143", "Item number type", @item_number_type)
        end
        # (1131) Code list qualifier 
        unless @code_list == nil
            rows << coded_row("1131", "Code list qualifier ", @code_list)
        end
        # (3055) Code list responsible agency, coded
        unless @agency == nil
            rows << coded_row("3055", "Code list responsible agency", @agency)
        end
        return rows
    end

    def debug
        super
        @product_identifier.tap { |v| puts "Product = " + v.ref if v != nil }
        @item_number.tap { |v| puts "Item number = " + v if v != nil }
        @item_number_type.tap { |v| puts "Number type = " + v.ref if v != nil }
        puts "\n"
    end
end