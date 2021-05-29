class UNT < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (0074) Number of segments in a message
        @number_of_segments = val(1, 0)
        # (0062) Message reference number
        @message_reference = val(2, 0)
    end

    def html
        coded = []
        typed = [[2, 0]]
        mssge = [[1, 0]]
        super(coded, typed, mssge)
    end

    def table
        rows = [header_row]
        # (0074) Number of segments in a message
        unless @number_of_segments == nil
            rows << ["0074", "Number of segments in a message", 
                @number_of_segments]
        end
        # (0062) Message reference number
        unless @message_reference == nil
            rows << ["0062", "Message reference number", @message_reference]
        end
        return rows
    end

    def debug
        super
        @number_of_segments.tap { |v| puts "Segments = " + v if v != nil }
        @message_reference.tap { |v| puts "Reference = " + v if v != nil }
        puts "\n"
    end
end