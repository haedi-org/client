class RFF < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (1153) Reference qualifier
        @reference = define([1, 0], "1153", "Reference qualifier", true)
        # (1154) Reference number
        @reference_number = define([1, 1], "1154", "Reference number")
        # (1156) Line number
        @line_number = define([1, 2], "1156", "Line number")
        # (4000) Reference version number
        @version = define([1, 3], "4000", "Reference version number")
        # Push to element
        push_elements([
            @reference, @reference_number, @line_number, @version
        ])
    end

    def html
        codes = [[1, 0]]
        typed = [[1, 1]]
        mssge = [[1, 2], [1, 3]]
        super(codes, typed, mssge)
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