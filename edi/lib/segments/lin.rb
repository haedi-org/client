class LIN < Line
    def initialize(data, version, chars)
        super(data, version, chars)
        # (1082) Line item number
        @line_item_number = val(1, 0)
        # (1229) Action request/notification, coded
        @action_request   = val(2, 0, "1229")
        # (7140) Item number
        @item_id          = val(3, 0)
        # (7143) Item number type, coded
        @item_type        = val(3, 1, "7143")
        # (1131) Code list qualifier
        @code_list        = val(3, 2, "1131")
        # (3055) Code list responsible agency, coded
        @agency           = val(3, 3, "3055")
    end

    def html
        coded = [[1, 0], [2, 0], [3, 1]]
        typed = [[3, 0]]
        super(coded, typed)
    end

    def table
        rows = [header_row]
        # (1082) Line item number
        unless @line_item_number == nil
            rows << ["1082", "Line item number", @line_item_number]
        end
        # (1229) Action request/notification, coded
        unless @action_request == nil
            rows << coded_row("1229", "Action request/notification", 
                @action_request)
        end
        # (7140) Item number
        unless @item_id == nil
            rows << ["7140", "Item number", @item_id]
        end
        # (7143) Item number type, coded
        unless @item_type == nil
            rows << coded_row("7143", "Item number type", @item_type) 
        end
        # (1131) Code list qualifier
        unless @code_list == nil
            rows << ["1131", "Code list qualifier", @code_list]
        end
        # (3055) Code list responsible agency, coded
        unless @agency == nil
            rows << ["3055", "Code list responsible agency", @agency]
        end
        return rows
    end

    def debug
        super
        @line_item_number.tap { |v| puts "Line item = " + v if v != nil }
        @action_request.tap { |v| puts "Action request = " + v.ref if v != nil }
        @item_id.tap { |v| puts "Item ID = " + v if v != nil }
        @item_type.tap { |v| puts "Item type = " + v.ref if v != nil }
        @code_list.tap { |v| puts "Code list = " + v.ref if v != nil }
        @agency.tap { |v| puts "Agency = " + v.ref if v != nil }
        puts "\n"
    end
end