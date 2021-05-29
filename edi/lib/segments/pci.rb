class PCI < Line
    def initialize(data, version, reference)
        super(data, version, reference)
        # (4233) Marking instructions, coded
        @marking_instructions = val(1, 0, "4233")
        # (7102) Shipping marks
        @shipping_marks       = val(2, 0)
    end

    def html
        coded = [[1, 0]]
        typed = [[2, 0]]
        super(coded, typed)
    end

    def table
        rows = [header_row]
        # (4233) Marking instructions, coded
        unless @marking_instructions == nil
            rows << coded_row("4233", "Marking instructions", 
                @marking_instructions)
        end
        # (7102) Shipping marks
        unless @shipping_marks == nil
            rows << ["7102", "Shipping marks", @shipping_marks.join("\n")]
        end
        return rows
    end

    def debug
        super
        @marking_instructions.tap { |v| puts "Marking = " + v.ref if v != nil }
        puts "\n"
    end
end