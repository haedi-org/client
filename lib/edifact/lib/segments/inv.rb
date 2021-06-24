class INV < Line
    def initialize(data, line_no, version, chars)
        super(data, line_no, version, chars)
        # (4501) Inventory movement direction, coded
        @movement_direction = define([1, 0], "4501", 
            "Inventory movement direction", true)
        # (7491) Type of inventory affected, coded
        @inventory_type = define([2, 0], "7491", "Type of inventory affected", 
            true)
        # (4499) Reason for inventory movement, coded
        @movement_reason = define([3, 0], "4499", 
            "Reason for inventory movement", true)
        # (4503) Inventory balance method, coded
        @balance_method = define([4, 0], "4503", "Inventory balance method", 
            true)
        # (4403) Instruction qualifier
        @instruction_qualifier = define([5, 0], "4403", "Instruction qualifier", 
            true)
        # (4401) Instruction, coded
        @instruction_coded = define([5, 1], "4401", "Coded instruction", true)
        # (1131) Code list qualifier
        @code_list = define([5, 2], "1131", "Code list qualifier", true)
        # (3055) Code list responsible agency, coded
        @agency = define([5, 3], "3055", "Code list responsible agency", true)
        # (4400) Instruction
        @instruction = define([5, 4], "4400" "Instruction")
        # Push to elements
        push_elements([
            @movement_direction, @inventory_type, @movement_reason, 
            @balance_method, @instruction_qualifier, @instruction_coded,
            @code_list, @agency, @instruction
        ])
    end

    def html
        coded = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [5, 1]]
        typed = [[5, 4]]
        super(coded, typed)
    end

    def debug
        super
        @movement_direction.tap { |v| puts "Direction = " + v.ref if v != nil }
        @inventory_type.tap { |v| puts "Inv type = " + v.ref if v != nil }
        @movement_reason.tap { |v| puts "Reason = " + v.ref if v != nil }
        @balance_method.tap { |v| puts "Method = " + v.ref if v != nil }
        @instruction_qualifier.tap { |v| puts "Qual = " + v.ref if v != nil }
        @instruction_coded.tap { |v| puts "Coded = " + v.ref if v != nil }
        @code_list.tap { |v| puts "Code list = " + v.ref if v != nil }
        @agency.tap { |v| puts "Agency = " + v.ref if v != nil }
        @instruction.tap { |v| puts "Instruction = " + v if v != nil }
        puts "\n"
    end
end