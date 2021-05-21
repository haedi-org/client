class RFF < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (1153) Reference qualifier
        @reference        = val(1, 0, "1153")
        # (1154) Reference number
        @reference_number = val(1, 1)
        # (1156) Line number
        @line_number      = val(1, 2)
        # (4000) Reference version number
        @version          = val(1, 3)
    end

    def html
        codes = [[1, 0]]
        typed = [[1, 1]]
        mssge = [[1, 2], [1, 3]]
        super(codes, typed, mssge)
    end

    def table
        rows = [header_row]
        # (1153) Reference qualifier
        unless @reference == nil
            rows << coded_row("1153", "Reference qualifier", @reference)
        end
        # (1154) Reference number
        unless @reference_number == nil
            rows << ["1154", "Reference number", @reference_number]
        end
        # (1156) Line number
        unless @line_number == nil
            rows << ["1156", "Line number", @line_number]
        end
        # (4000) Reference version number
        unless @version == nil
            rows << ["4000", "Reference version number", @version]
        end
        return rows
    end

    def debug
        super
        @reference.tap { |v| puts "Reference = " + v.ref if v != nil }
        @reference_number.tap { |v| puts "Reference number = " + v if v != nil }
        @line_number.tap { |v| puts "Line number = " + v if v != nil }
        @version.tap { |v| puts "Ref version = " + v if v != nil }
        puts "\n"
    end
end