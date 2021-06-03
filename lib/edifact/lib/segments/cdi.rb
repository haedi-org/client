class CDI < Line
    def initialize(data, version, reference)
        super(data, version, reference)
        # (7001) Physical or logical state qualifier
        @state_qualifier = val(1, 0, "7001")
        # (7007) Physical or logical state, coded
        @state_coded = val(2, 0, "7007")
        # (1131) Code list qualifier
        @code_list = val(2, 1, "1131")
        # (3055) Code list responsible agency, coded
        @agency = val(2, 2, "3055")
        # (7006) Physical or logical state
        @state = val(2, 3)
    end

    def html
        coded = [[1, 0], [2, 0]]
        typed = [[2, 3]]
        mssge = [[2, 1], [2, 2]]
        super(coded, typed, mssge)
    end

    def table
        rows = [header_row]
        # (7001) Physical or logical state qualifier
        unless @state_qualifier == nil
            rows << coded_row("7001", "Physical or logical state qualifier", 
                @state_qualifier)
        end
        # (7007) Physical or logical state, coded
        unless @state_coded == nil
            rows << coded_row("7007", "Physical or logical state", @state_coded)
        end
        # (1131) Code list qualifier
        unless @code_list == nil
            rows << coded_row("1131", "Code list qualifier", @code_list)
        end
        # (3055) Code list responsible agency, coded
        unless @agency == nil
            rows << coded_row("3055", "Code list responsible agency", @agency)
        end
        # (7006) Physical or logical state
        unless @state == nil
            rows << ["7006", "Physical or logical state", @state]
        end
        return rows
    end

    def debug
        super
        puts "\n"
    end
end