class UNZ < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (0036) Interchange control count
        @control_count = val(1, 0)
        # (0020) Interchange control reference
        @control_reference = val(2, 0)
    end

    def html
        coded = []
        typed = [[2, 0]]
        mssge = [[1, 0]]
        super(coded, typed, mssge)
    end

    def table
        rows = [header_row]
        # (0036) Interchange control count
        unless @control_count == nil
            rows << ["0036", "Interchange control count", @control_count]
        end
        # (0020) Interchange control reference
        unless @control_reference == nil
            rows << ["0020", "Interchange control reference", 
                @control_reference]
        end
        return rows
    end

    def debug
        super
        @control_count.tap { |v| puts "Control count = " + v if v != nil }
        @control_reference.tap { |v| puts "Control ref = " + v if v != nil }
        puts "\n"
    end
end