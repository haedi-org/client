class GIN < Line
    def initialize(data, version, reference)
        super(data, version, reference)
        # (7405) Identity number qualifier
        @identity_qualifier = val(1, 0, "7405")
        # (7402) Identity number
        @identity_range     = [val(2, 0), val(2, 1)].compact
    end

    def html
        coded = [[1, 0]]
        typed = [[2, 0], [2, 1]]
        super(coded, typed)
    end

    def table
        rows = [header_row]
        # (7405) Identity number qualifier
        unless @identity_qualifier == nil
            rows << coded_row("7405", "Identity number qualifier", 
                @identity_qualifier)
        end
        # (7402) Identity number
        unless @identity_range == nil
            rows << ["7402", "Identity number(s)", @identity_range.join("-")]
        end
        return rows
    end

    def debug
        super
        @identity_qualifier.tap { |v| puts "Identity = " + v.ref if v != nil }
        @identity_range.tap { |v| puts "Range = " + v.inspect if v != nil }
        puts "\n"
    end
end