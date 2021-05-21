class NAD < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (3035) Party qualifier
        @party_function = val(1, 0, "3035")
        # (3039) Party id. identification
        @party_id       = val(2, 0)
        # (1131) Code list qualifier
        @code_list      = val(2, 1, "1131")
        # (3055) Code list responsibly agency 
        @agency         = val(2, 2, "3055")
        # (3124) Name and address line (5 lines)
        @address        = val(3)
        # (3036) Party name (5 lines)
        @party_name     = val(4)[0, 5]
        # (3045) Party name format, coded
        @party_format   = val(4, 5, "3045")
        # (3042) Street and number/p.o. box (4 lines)
        @street         = val(5)
        # (3164) City name
        @city           = val(6, 0)
        # (3229) Country sub-entity identification
        @region         = val(7, 0)
        # (3251) Postcode identification
        @postcode       = val(8, 0)
        # (3207) Country, coded
        @country        = val(9, 0, "3207")
    end

    def html
        codes = [[1, 0], [4, 5], [9, 0]]
        typed = [[2, 0],
                 [3, 0], [3, 1], [3, 2], [3, 3], [3, 4],
                 [4, 0], [4, 1], [4, 2], [4, 3], [4, 4],
                 [5, 0], [5, 1], [5, 2], [5, 3],
                 [6, 0], [7, 0], [8, 0]
                ]
        mssge = [[2, 1], [2, 2]]
        super(codes, typed, mssge)
    end

    def table
        rows = [header_row]
        # (3035) Party qualifier
        unless @party_function == nil
            rows << coded_row("3035", "Party qualifier", @party_function)
        end
        # (3039) Party id. identification
        unless @party_id == nil
            rows << ["3039", "Party identification", @party_id]
        end
        # (1131) Code list qualifier
        unless @code_list == nil
            rows << coded_row("1131", "Code list qualifier", @code_list)
        end
        # (3055) Code list responsibly agency 
        unless @agency == nil
            rows << coded_row("3055", "Code list responsibly agency ", @agency)
        end
        # (3124) Name and address line (5 lines)
        unless (@address == nil || @address == [])
            rows << ["3124", "Name and address line", @address.join("\n")]
        end
        # (3036) Party name (5 lines)
        unless (@party_name == nil || @party_name == [])
            rows << ["3036", "Party name", @party_name.join("\n")]
        end
        # (3045) Party name format, coded
        unless @party_format == nil
            rows << coded_row("3045", "Party name format", @party_format)
        end
        # (3042) Street and number/p.o. box (4 lines)
        unless (@street == nil || @street == [])
            rows << ["3042", "Street and number/p.o. box", @street.join("\n")]
        end
        # (3164) City name
        unless @city == nil
            rows << ["3164", "City name", @city]
        end
        # (3229) Country sub-entity identification
        unless @region == nil
            rows << ["3229", "Country sub-entity identification", @region]
        end
        # (3251) Postcode identification
        unless @postcode == nil
            rows << ["3251", "Postcode identification", @postcode]
        end
        # (3207) Country, coded
        unless @country == nil
            rows << coded_row("3207", "Country", @country)
        end
        return rows
    end

    def debug
        super
        @party_function.tap { |v| puts "Function = " + v.ref if v != nil }
        @party_id.tap { |v| puts "ID = " + v if v != nil }
        @code_list.tap { |v| puts "Code list = " + v.ref if v != nil }
        @agency.tap { |v| puts "Agency = " + v.ref if v != nil }
        puts "\n"
    end
end