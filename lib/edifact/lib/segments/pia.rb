class PIA < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (4347) Product id. function qualifier
        @product_identifier = define([1, 0], "4347", 
            "Product id. function qualifier", true)
        # (7140) Item number
        @item_number = define([2, 0], "7140", "Item number")
        # (7143) Item number type, coded
        @item_number_type = define([2, 1], "7143", "", true)
        # (1131) Code list qualifier
        @code_list = define([2, 2], "1131", "Code list qualifier", true)
        # (3055) Code list responsible agency, coded
        @agency = define([2, 3], "3055", "Code list responsible agency", true)
        # Push to elements
        push_elements([
            @product_identifier, @item_number, @item_number_type, @code_list,
            @agency
        ])
    end

    def html
        coded = [[1, 0], [2, 1]]
        typed = [[2, 0]]
        mssge = [[2, 2], [2, 3]]
        super(coded, typed, mssge)
    end

    def debug
        super
        @product_identifier.tap { |v| puts "Product = " + v.ref if v != nil }
        @item_number.tap { |v| puts "Item number = " + v if v != nil }
        @item_number_type.tap { |v| puts "Number type = " + v.ref if v != nil }
        puts "\n"
    end
end