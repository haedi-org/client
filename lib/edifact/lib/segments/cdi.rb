class CDI < Line
    def initialize(data, version, reference)
        super(data, version, reference)
        # (7001) Physical or logical state qualifier
        @state_qualifier = define([1, 0], "7001", 
            "Physical or logical state qualifier", true)
        # (7007) Physical or logical state, coded
        @state_coded = define([2, 0], "7007", "Physical or logical state", true)
        # (1131) Code list qualifier
        @code_list = define([2, 1], "1131", "Code list qualifier", true)
        # (3055) Code list responsible agency, coded
        @agency = define([2, 2], "3055", "Code list responsible agency", true)
        # (7006) Physical or logical state
        @state = define([2, 3], "7006", "Physical or logical state")
        # Push to qualifier
        push_elements([
            @state_qualifier, @state_coded, @code_list, @agency, @state
        ])
    end

    def html
        coded = [[1, 0], [2, 0]]
        typed = [[2, 3]]
        mssge = [[2, 1], [2, 2]]
        super(coded, typed, mssge)
    end

    def debug
        super
        puts "\n"
    end
end