class UNZ < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (0036) Interchange control count
        @control_count = define([1, 0], "0036", "Interchange control count")
        # (0020) Interchange control reference
        @control_reference = define([2, 0], "0020", 
            "Interchange control reference")
        # Push to elements
        push_elements([
            @control_count, @control_reference
        ])
    end

    def html
        coded = []
        typed = [[2, 0]]
        mssge = [[1, 0]]
        super(coded, typed, mssge)
    end

    def debug
        super
        @control_count.tap { |v| puts "Control count = " + v if v != nil }
        @control_reference.tap { |v| puts "Control ref = " + v if v != nil }
        puts "\n"
    end
end