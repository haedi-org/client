class IMD < Line
    def initialize(data, line_no, version, chars)
        super(data, line_no, version, chars)
        # (7077) Item description type, coded
        @description_type = define([1, 0], "7077", "Item description type", 
            true)
        # (7081) Item characteristic, coded
        @characteristic = define([2, 0], "7081", "Item charasteristic", true)
        # (1131) Item characteristic code list qualifier
        @characteristic_code_list = define([2, 1], "1131", 
            "Item characteristic code list qualifier", true)
        # (3055) Item characteristic code list responsible agency, coded
        @characteristic_agency = define([2, 2], "3055", 
            "Item characteristic code list responsible agency", true)
        # (7009) Item description identification
        @description_code = define([3, 0], "7009", 
            "Item description identification")
        # (1131) Item description code list qualifier
        @description_code_list = define([3, 1], "1131", 
            "Item description code list qualifier", true)
        # (3055) Item description code list responsible agency, coded
        @description_agency = define([3, 2], "3055", 
            "Item description code list responsible agency", true)
        # (7008) Item description
        @description = [
            define([3, 3], "7008", "Item description"), 
            define([3, 4], "7008", "Item description")
        ].compact
        # (3453) Language, coded
        @language = define([3, 5], "3453", "Language", true)
        # Push to elements
        push_elements([
            @description_type, @characteristic, @characteristic_code_list, 
            @characteristic_agency, @description_code, @description_code_list,
            @description_agency, @description
        ].flatten)
    end

    def html
        coded = [[1, 0], [2, 0], [3, 5]]
        typed = [[3, 0], [3, 3], [3, 4]]
        mssge = [[2, 1], [2, 2], [3, 1], [3, 2]]
        super(coded, typed, mssge)
    end

    def debug
        super
        @description_type.tap { |v| puts "Desc type = " + v.ref if v != nil }
        @characteristic.tap { |v| puts "Char = " + v.ref if v != nil }
        @description_code.tap { |v| puts "Type = " + v if v != nil }
        @description_agency.tap { |v| puts "Agency = " + v.ref if v != nil }
        @description.tap { |v| puts "Desc = " + v.join(" ") if v != [] }
    end
end