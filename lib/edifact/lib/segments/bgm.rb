class BGM < Line
    def initialize(data, line_no, version, chars)
        super(data, line_no, version, chars)
        # (1001) Document/message name, coded
        @coded_message_name = define([1, 0], "1001", "Document/message name", 
            true)
        # (1131) Code list qualifier
        @code_list = define([1, 1], "1131", "Document/message name", true)
        # (3055) Code list responsible agency, coded
        @agency = define([1, 2], "3055", "Code list responsible agency", true)
        # (1000) Document/message name
        @message_name = define([1, 3], "1000", "Document/message name")
        # (1004) Document/message number
        @message_number = define([2, 0], "1004", "Document/message number")
        # (1225) Message function, coded
        @message_function = define([3, 0], "1225", "Message function", true)
        # (4343) Response type, coded
        @response_type = define([4, 0], "4343", "Response type", true)
        # Push to elements
        push_elements([
            @coded_message_name, @code_list, @agency, @message_name,
            @message_number, @message_function, @response_type
        ])
    end

    def html
        coded = [[1, 0], [3, 0], [4, 0]]
        typed = [[1, 3], [2, 0]]
        super(coded, typed)
    end

    def debug
        super
        puts "\n"
    end
end