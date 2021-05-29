class BGM < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (1001) Document/message name, coded
        @coded_message_name = val(1, 0, "1001")
        # (1131) Code list qualifier
        @code_list          = val(1, 1, "1131")
        # (3055) Code list responsible agency, coded
        @agency             = val(1, 2, "3055")
        # (1000) Document/message name
        @message_name       = val(1, 3)
        # (1004) Document/message number
        @message_number     = val(2, 0)
        # (1225) Message function, coded
        @message_function   = val(3, 0, "1225")
        # (4343) Response type, coded
        @response_type      = val(4, 0, "4343")
    end

    def html
        coded = [[1, 0], [3, 0], [4, 0]]
        typed = [[1, 3], [2, 0]]
        super(coded, typed)
    end

    def table
        rows = [header_row]
        # (1001) Document/message name, coded
        unless @coded_message_name == nil
            rows << coded_row("1001", "Message name", @coded_message_name)
        end
        # (1131) Code list qualifier
        unless @code_list == nil
            rows << coded_row("1131", "Code list qualifier", @code_list)
        end
        # (3055) Code list responsible agency, coded
        unless @agency == nil
            rows << coded_row("3055", "Code list responsible agency", @agency)
        end
        # (1000) Document/message name
        unless @message_name == nil
            rows << ["1000", "Document/message name", @message_name]
        end
        # (1004) Document/message number
        unless @message_number == nil
            rows << ["1004", "Document/message number", @message_number]
        end
        # (1225) Message function, coded
        unless @message_function == nil
            rows << coded_row("1225", "Message function", @message_function)
        end
        # (4343) Response type, coded
        unless @response_type == nil
            rows << coded_row("4343", "Response type", @response_type)
        end
        return rows
    end

    def debug
        super
        @message_name.tap { |v| puts "Message = " + v.ref if v != nil }
        @message_name.tap { |v| puts "Description = " + v.desc if v != nil }
        @code_list.tap { |v| puts "Code list = " + v.ref if v != nil }
        @agency.tap { |v| puts "Agency = " + v.ref if v != nil }
        @written_message_name.tap { |v| puts "Name = " + v if v != nil }
        @message_number.tap { |v| puts "Number = " + v if v != nil }
        @message_function.tap { |v| puts "Function = " + v.ref if v != nil }
        @response_type.tap { |v| puts "Response type = " + v.ref if v != nil }
        puts "\n"
    end
end