class PCI < Line
    def initialize(data, version, reference)
        super(data, version, reference)
        # (4233) Marking instructions, coded
        @marking_instructions = define([1, 0], "4233", "Marking instructions", 
            true)
        # (7102) Shipping marks
        @shipping_marks = define([2, 0], "7102", "Shipping marks")
        # Push to elements
        push_elements([
            @marking_instructions, @shipping_marks
        ])
    end

    def html
        coded = [[1, 0]]
        typed = [[2, 0]]
        super(coded, typed)
    end

    def debug
        super
        @marking_instructions.tap { |v| puts "Marking = " + v.ref if v != nil }
        puts "\n"
    end
end