class UNT < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (0074) Number of segments in a message
        @number_of_segments = define([1, 0], "0074", 
            "Number of segments in a message")
        # (0062) Message reference number
        @message_reference = define([2, 0], "0062", "Message reference number")
        # Push to elements
        push_elements([
            @number_of_segments, @message_reference
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
        @number_of_segments.tap { |v| puts "Segments = " + v if v != nil }
        @message_reference.tap { |v| puts "Reference = " + v if v != nil }
        puts "\n"
    end
end