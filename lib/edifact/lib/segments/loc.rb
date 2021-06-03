class LOC < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (3227) Location function code qualifier
        @function = val(1, 0, "3227")
        # (3225) Place/location identification
        @identification = val(2, 0)
        # (1131) Location code list qualifier
        @code_list = val(2, 1, "1131")
        # (3055) Code list responsible agency, coded
        @agency = val(2, 2, "3055")
        # (3244) Place/location
        @location = val(2, 3)
    end

    def html
        codes = [[1, 0]]
        typed = [[2, 0], [2, 3]]
        mssge = [[2, 1], [2, 2]]
        super(codes, typed, mssge)
    end

    def table
        rows = [header_row]
        # (3227) Location function code qualifier
        unless @function == nil
            rows << coded_row("3227", "Location function code qualifier", 
                @function)
        end
        # (3225) Place/location identification
        unless @identification == nil
            rows << ["3225", "Place/location identification", @identification]
        end
        # (1131) Location code list qualifier
        unless @code_list == nil
            rows << coded_row("1131", "Location code list qualifier", 
                @code_list)
        end
        # (3055) Code list responsible agency, coded
        unless @agency == nil
            rows << coded_row("3055", "Code list responsible agency", 
                @agency)
        end
        # (3244) Place/location
        unless @location == nil
            rows << ["3244", "Place/location", @location]
        end
        return rows
    end

    def debug
        super
        @function.tap { |v| puts "Function = " + v.ref if v != nil }
        @identification.tap { |v| puts "ID = " + v if v != nil }
        @location.tap { |v| puts "Location = " + v if v != nil }
        puts "\n"
    end
end