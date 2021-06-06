class GIN < Line
    def initialize(data, version, reference)
        super(data, version, reference)
        # (7405) Identity number qualifier
        @identity_qualifier = define([1, 0], "7405", 
            "Identify number qualifier", true)
        # (7402) Identity number
        @identity_range = [
            define([2, 0], "7402", "Identity number"),
            define([2, 1], "7402", "Identity number")
        ]
        # Push to elements
        push_elements([
            @identity_qualifier, @identity_range
        ].flatten)
    end

    def html
        coded = [[1, 0]]
        typed = [[2, 0], [2, 1]]
        super(coded, typed)
    end

    def debug
        super
        @identity_qualifier.tap { |v| puts "Identity = " + v.ref if v != nil }
        @identity_range.tap { |v| puts "Range = " + v.inspect if v != nil }
        puts "\n"
    end
end