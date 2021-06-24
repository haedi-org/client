class LIN < Line
    def initialize(data, line_no, version, chars)
        super(data, line_no, version, chars)
        # (1082) Line item number
        @line_item_number = define([1, 0], "1082", "Line item number")
        # (1229) Action request/notification, coded
        @action_request = define([2, 0], "1229", "Action request/notification", 
            true)
        # (7140) Item number
        @item_id = define([3, 0], "7140", "Item number")
        # (7143) Item number type, coded
        @item_type = define([3, 1], "7143", "Item number type", true)
        # (1131) Code list qualifier
        @code_list = define([3, 2], "1131", "Code list qualifier", true)
        # (3055) Code list responsible agency, coded
        @agency = define([3, 3], "3055", "Code list responsible agency", true)
        # Push to elements
        push_elements([
            @line_item_number, @action_request, @item_id, @item_type, 
            @code_list, @agency
        ])
    end

    def html
        coded = [[1, 0], [2, 0], [3, 1]]
        typed = [[3, 0]]
        super(coded, typed)
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