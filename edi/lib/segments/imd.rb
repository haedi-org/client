class IMD < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (7077) Item description type, coded
        @description_type         = val(1, 0, "7077")
        # (7081) Item characteristic, coded
        @characteristic           = val(2, 0, "7081")
        # (1131) Item characteristic code list qualifier
        @characteristic_code_list = val(2, 1, "1131")
        # (3055) Item characteristic code list responsible agency, coded
        @characteristic_agency    = val(2, 2, "3055")
        # (7009) Item description identification
        @description_code         = val(3, 0)
        # (1131) Item description code list qualifier
        @description_code_list    = val(3, 1, "1131")
        # (3055) Item description code list responsible agency, coded
        @description_agency       = val(3, 2, "3055")
        # (7008) Item description
        @description              = [val(3, 3), val(3, 4)].compact
        # (3453) Language, coded
        @language                 = val(3, 5, "3453")
    end

    def html
        coded = [[1, 0], [2, 0], [3, 5]]
        typed = [[3, 0], [3, 3], [3, 4]]
        mssge = [[2, 1], [2, 2], [3, 1], [3, 2]]
        super(coded, typed, mssge)
    end

    def table
        rows = [header_row]
        # (7077) Item description type, coded
        unless @description_type == nil
            rows << coded_row("7077", "Item description type", 
                @description_type)
        end
        # (7081) Item characteristic, coded
        unless @characteristic == nil
            rows << coded_row("7081", "Item characteristic", @characteristic)
        end
        # (1131) Item characteristic code list qualifier
        unless @characteristic_code_list == nil
            rows << coded_row("1131", "Item characteristic code list qualifier", 
                @characteristic_code_list)
        end
        # (3055) Item characteristic code list responsible agency, coded
        unless @characteristic_agency == nil
            rows << coded_row("3055", 
                "Item characteristic code list responsible agency", 
                @characteristic_agency)
        end
        # (7009) Item description identification
        unless @description_code == nil
            rows << ["7009", "Item description identification", 
                @description_code]
        end
        # (1131) Item description code list qualifier
        unless @description_code_list == nil
            rows << coded_row("1131", "Item description code list qualifier", 
                @description_code_list)
        end
        # (3055) Item description code list responsible agency, coded
        unless @description_agency == nil
            rows << coded_row("3055", 
                "Item description code list responsible agency", 
                @description_agency)
        end
        # (7008) Item description
        unless @description == nil
            rows << ["7008", "Item description", @description.join("\n")]
        end
        # (3453) Language, coded
        unless @language == nil
            rows << coded_row("3453", "Language", @language)
        end
        return rows
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